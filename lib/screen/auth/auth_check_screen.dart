import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';
import 'package:onze_coffee_app/screen/auth/login_screen.dart';
import 'package:onze_coffee_app/screen/employee/admin_nav.dart';
import 'package:onze_coffee_app/screen/user/nav_bar/user_nav.dart';
import 'package:onze_coffee_app/widget/comment/custom_loading.dart';

class AuthCheckScreen extends StatelessWidget {
  const AuthCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..loginCurrentUser(),
      child: Builder(builder: (context) {
        final authCubit = context.read<AuthCubit>();
        return BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              customLoading(context: context);
            }
            if (state is AuthSuccessToken) {
              Navigator.pop(context);
              
   if (authCubit.userLayer.user.role == "user") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserNav(),
                    ));
              } else if (authCubit.userLayer.user.role == "employee") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminNav(),
                    ));
              }
              if(state is LoginState) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              }
            }
          },
          child: const Scaffold(
            body: SafeArea(
                child: Column(
              children: [],
            )),
          ),
        );
      }),
    );
  }
}
