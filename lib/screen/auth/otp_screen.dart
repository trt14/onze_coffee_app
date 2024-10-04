import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/screen/user/nav_bar/user_nav.dart';
import 'package:onze_coffee_app/screen/user/user_home_screen.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';
import 'package:onze_coffee_app/widget/custom_pinput.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  OtpScreen({super.key, required this.email});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Please enter the OTP sent to ',
                      style: TextStyle(
                        color: AppColor.white,
                      )),
                  Text('$email',
                      style: TextStyle(
                          color: AppColor.forth, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              // TextField(
              //   controller: otpController,
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     labelText: 'OTP',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              const CustomPinput(),
              const SizedBox(height: 20),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    // Show loading indicator
                  } else if (state is AuthSuccess) {
                    // OTP verification success, navigate to next screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserNav()));
                  } else if (state is AuthFailure) {
                    // Show error message
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
                      //       context.read<AuthCubit>().verifyEmailOtp(
                      //           email: email, otp: otpController.text);
                      //     },
                      //     child: Text('Verify OTP'),
                      //   );
                      : CustomMainButton(
                          title: "Verify OTP",
                          color: AppColor.secondary,
                          onPressed: () async {
                            // await addProductCubit.addProduct();
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
