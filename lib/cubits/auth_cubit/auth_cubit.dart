import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  /*
  *
  * Verify the email OTP
  *
  * */
  Future<void> verifyEmailOtp(
      {required String email, required String otp}) async {
    emit(AuthLoading());
    try {
      // Call the repository function to verify OTP
      final result = await AuthRepository().verifyOtp(
          email: email,
          otp: otp,
          fName: 'Sami',
          lName: 'Mahdi',
          phoneNumber: '059');

      if (result != '') {
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
  Future<void> sendOtpToEmail(String email) async {
    emit(AuthLoading());
    try {
      // Call the repository function to send the OTP to the email
      await AuthRepository().signUp(email: email);
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthFailure('Failed to send OTP. Please try again.'));
    }
  }
}
