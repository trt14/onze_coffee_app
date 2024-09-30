part of 'auth_cubit.dart';

// Define the base state class
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Initial state when no action has taken place
class AuthInitial extends AuthState {}

// Loading state to show during authentication/OTP verification process
class AuthLoading extends AuthState {}

// Success state when authentication or OTP verification succeeds
class AuthSuccess extends AuthState {}

// Failure state with an error message
class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
