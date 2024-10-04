import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
//?--- Text Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  AuthCubit() : super(AuthInitial());

  /*
  *
  * Verify the email OTP
  *
  * */
  Future<void> verifyEmailOtp(
      {required String email, required String otp}) async {
    await Future.delayed(Duration.zero);

    emit(AuthLoading());
    try {
      // Call the repository function to verify OTP
      final result = await AuthRepository().verifyOtp(
        email: email,
        otp: otp,
      );
      if (result == true) {
        // OTP verification successful
        emit(AuthSuccess());
      } else {
        // OTP verification failed
        emit(AuthFailure('Invalid OTP. Please try again.'));
      }
    } catch (error) {
      // Handle any errors during the process
      emit(AuthFailure(error.toString()));
    }
  }

  /*
  *
  * Method to initiate sending OTP (if needed)
  *
  * */

  Future eventLogin() async {
    print("login");
    await Future.delayed(Duration.zero);
    emit(AuthLoading());
    try {
      // Call the repository function to send the OTP to the email
     bool status = await AuthRepository().login(email: emailController.text.trim());
     if(status) emit(AuthSuccess());
    } catch (error) {
      emit(AuthFailure('Failed to send OTP. Please try again.'));
    }
  }

  Future<void> signUp() async {
    await Future.delayed(Duration.zero);
    emit(AuthLoading());

    print("iam at cubit signUp");
    emit(AuthLoading());
    try {
      // Call the repository function to send the OTP to the email
      await AuthRepository().signUp(
          email: emailController.text.trim(),
          fName: firstNameController.text.trim(),
          lName: lastNameController.text.trim(),
          phoneNumber: phoneController.text.trim());
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthFailure('Failed to send OTP. Please try again.'));
    }
  }
}
