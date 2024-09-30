part of 'admin_nav_cubit.dart';

@immutable
sealed class AdminNavState {}

final class AdminNavInitial extends AdminNavState {}

final class Navigate extends AdminNavState{}
