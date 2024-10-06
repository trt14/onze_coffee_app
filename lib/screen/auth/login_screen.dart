import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/helper/custom_alert.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/screen/auth/register_screen.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';
import 'package:onze_coffee_app/widget/custom_text_field.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(builder: (context) {
        final authCubit = context.read<AuthCubit>();
        return Scaffold(
          backgroundColor: AppColor.primary,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  SizedBox(
                    width: context.getWidth(value: 1),
                    height: context.getWidth(value: 0.5),
                    child: Image.asset("assets/logo/onze_logo.png"),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    title: "Email",
                    hint: "Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: authCubit.emailController,
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoading) {
                        // Show a loading spinner or progress bar
                      }
                      if (state is AuthSuccess) {
                        // If OTP sent successfully, navigate to OTP verification screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(
                              type: 0,
                              email: authCubit.emailController.text.trim(),
                            ),
                          ),
                        );
                      } else if (state is AuthFailure) {
                        showAlertSnackBar(
                            context: context,
                            color: AppColor.secondary,
                            title: state.errorMessage,
                            colorStatus: AppColor.secondary);
                      }
                    },
                    builder: (context, state) {
                      return state is AuthLoading
                          ? const CircularProgressIndicator(
                              color: AppColor.secondary,
                            )
                          : CustomMainButton(
                              title: "Login",
                              color: AppColor.secondary,
                              onPressed: () async {
                                await authCubit.eventLogin();
                              },
                            );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text("Create new account ?",
                        style: TextStyle(color: AppColor.white)),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: context.getHeight(value: 0.23),
                    child: Image.asset(
                      "assets/images/onzo-icon.png",
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
