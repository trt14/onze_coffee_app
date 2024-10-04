part of 'user_home_cubit.dart';

@immutable
sealed class UserHomeState {}

final class UserHomeInitial extends UserHomeState {}

final class ProductLoadingState extends UserHomeState {}

final class GetProductSuccessState extends UserHomeState {}

final class UpdateChipsState extends UserHomeState {}
