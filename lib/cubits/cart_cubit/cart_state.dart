part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class SuccessCartState extends CartState {
  final String msg;
  SuccessCartState({required this.msg});
}

final class ErrorCartState extends CartState {
  final String msg;
  ErrorCartState({required this.msg});
}

final class LoagingCartState extends CartState {}
