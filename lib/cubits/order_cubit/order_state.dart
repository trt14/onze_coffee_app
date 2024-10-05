part of 'order_cubit.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class LoadingOrderState extends OrderState {}

final class ErrorOrderState extends OrderState {
  final String msg;
  const ErrorOrderState({required this.msg});
}

final class ErrorOrderPaymentState extends OrderState {
  final String msg;
  const ErrorOrderPaymentState({required this.msg});
}

final class SuccessOrderPaymentState extends OrderState {
  final String msg;
  const SuccessOrderPaymentState({required this.msg});
}

final class SuccessOrderState extends OrderState {
  final String msg;
  const SuccessOrderState({required this.msg});
}

final class SuccessState extends OrderState {}
final class FailedState extends OrderState{}
