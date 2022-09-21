import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsf_intern/model/user_model.dart';
import 'package:tsf_intern/screens/login_screen.dart';
import 'package:tsf_intern/shared/cubit/cubit.dart';
import 'package:tsf_intern/shared/cubit/states.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..getUserInfo(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          // final user = cubit.user;
          UserModel? user = cubit.currentUser;
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
            body: ConditionalBuilder(
              condition: user !=null,
              builder:(context)=>Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   ListTile(
                    leading: CircleAvatar(
                      radius: user!.pictureModel!.width! /6,
                      backgroundImage: NetworkImage(user.pictureModel!.url!),
                    ),
                     title: Text(user.name!),
                     subtitle: Text(user.email!),
                  ),
                ],
              ) ,
              fallback:(context)=>const Center(child: CircularProgressIndicator()) ,
            ),
          );
        },
      ),
    );
  }
}
