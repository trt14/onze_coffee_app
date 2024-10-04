import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/screen/auth/login_screen.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';
import 'package:onze_coffee_app/widget/custom_text_field.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import 'otp_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  const SizedBox(height: 30),
                  SizedBox(
                    width: context.getWidth(value: 1),
                    height: context.getWidth(value: 0.5),
                    child: Image.asset("assets/logo/onze_logo.png"),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    title: "Email",
                    hint: "Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: authCubit.emailController,
                  ),
                  CustomTextField(
                    title: "First Name",
                    hint: "First name",
                    controller: authCubit.firstNameController,
                  ),
                  CustomTextField(
                    title: "Last Name",
                    hint: "Last name",
                    controller: authCubit.lastNameController,
                  ),
                  CustomTextField(
                    title: "Phone Number",
                    hint: "Phone number",
                    keyboardType: TextInputType.phone,
                    controller: authCubit.phoneController,
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
                              email: authCubit.emailController.text,
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
                          : CustomMainButton(
                              title: "Register",
                              color: AppColor.secondary,
                              onPressed: () async {
                                await authCubit.signUp();
                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OtpScreen(
                                              email: authCubit
                                                  .emailController.text
                                                  .trim())));
                                }
                              },
                            );
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text("You have account already ?",
                        style: TextStyle(color: AppColor.white)),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
