import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsf_intern/model/user_model.dart';
import 'package:tsf_intern/screens/login_screen.dart';
import 'package:tsf_intern/shared/cubit/cubit.dart';
import 'package:tsf_intern/shared/cubit/states.dart';

class GoogleUserInfoScreen extends StatelessWidget {
  const GoogleUserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          final user = cubit.user;

          return Scaffold(
            appBar: AppBar(
              title: const Text('User Info'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.logout().then((value) {
                      print('logout successfully');
                    }).catchError((error) {
                      print('error: ${error.toString()}');
                    });
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                  title: Text(user.displayName!),
                  subtitle: Text(user.email!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
