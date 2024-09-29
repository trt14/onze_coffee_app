part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class LoadingCategoryState extends CategoryState {}

final class SuccessCategoryState extends CategoryState {
  final String msg;
  SuccessCategoryState({required this.msg});
}

final class ErrorCategoryState extends CategoryState {
  final String msg;
  ErrorCategoryState({required this.msg});
}
