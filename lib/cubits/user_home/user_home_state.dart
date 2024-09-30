part of 'user_home_cubit.dart';

@immutable
sealed class UserHomeState {}

final class UserHomeInitial extends UserHomeState {}
final class LoadingState extends UserHomeState {}

final class GetProductSuccessState extends UserHomeState {}