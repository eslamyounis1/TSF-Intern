import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsf_intern/screens/login_screen.dart';
import 'package:tsf_intern/shared/cubit/cubit.dart';
import 'package:tsf_intern/shared/cubit/states.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          }
        },
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
                    cubit.logout().then((value) {}).catchError((error) {});
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.email!),
                Text(user.displayName!),
              ],
            ),
          );
        },
      ),
    );
  }
}
