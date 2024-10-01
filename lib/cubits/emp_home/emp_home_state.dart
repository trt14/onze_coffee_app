part of 'emp_home_cubit.dart';

sealed class EmpHomeState extends Equatable {
  const EmpHomeState();

  @override
  List<Object> get props => [];
}

final class EmpHomeInitial extends EmpHomeState {}

final class SuccessState extends EmpHomeState {}

final class LoadingState extends EmpHomeState {}