import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/screen/auth/register_screen.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';
import 'package:onze_coffee_app/widget/custom_text_field.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../data/repositories/auth_repository.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                controller: emailController,
              ),
              const SizedBox(height: 20),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    // Show a loading spinner or progress bar
                  } else if (state is AuthSuccess) {
                    // If OTP sent successfully, navigate to OTP verification screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(
                          email: emailController.text,
                        ),
                      ),
                    );
                  } else if (state is AuthFailure) {
                    // Show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  return state is AuthLoading
                      ? const CircularProgressIndicator()
                      // : ElevatedButton(
                      //     onPressed: () {
                      //       // Trigger sending OTP to email
                      //       context
                      //           .read<AuthCubit>()
                      //           .sendOtpToEmail(emailController.text);
                      //     },
                      //     child: const Text('Send OTP'),
                      //   );
                      : CustomMainButton(
                          title: "Login",
                          color: AppColor.secondary,
                          onPressed: () async {
                            await context
                                .read<AuthCubit>()
                                .sendOtpToEmail(emailController.text);
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                        );
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
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
  }
}
