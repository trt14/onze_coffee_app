import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/screen/user/user_home_screen.dart';

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
        appBar: AppBar(
          title: Text('Enter OTP'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please enter the OTP sent to $email'),
              SizedBox(height: 20),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    // Show loading indicator
                  } else if (state is AuthSuccess) {
                    // OTP verification success, navigate to next screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserHomeScreen()));
                  } else if (state is AuthFailure) {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  return state is AuthLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().verifyEmailOtp(
                                email: email!, otp: otpController.text);
                          },
                          child: Text('Verify OTP'),
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
