part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class LoadingState extends AddProductState{}

final class SuccessState extends AddProductState {}

final class FailedAddProductState extends AddProductState{}