import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tsf_intern/shared/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(): super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Users Login via Google third_party provider
  Future<String?> loginWithGoogle() async {
    try{
    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult =
    await _firebaseAuth.signInWithCredential(authCredential);
    final User? user = authResult.user;
    if (user != null) {
      return '$user';


    }
    return null;
  } on FirebaseAuthException catch(error){
      emit(LoginErrorState(error.toString()));
    }
  }

  // Users Login via Facebook third_party provider
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
Future<bool> logout()async{
    try{
    googleSignIn.disconnect();
    await FacebookAuth.instance.logOut();
    return true;
    } catch (e){
      return false;
    }

}
}