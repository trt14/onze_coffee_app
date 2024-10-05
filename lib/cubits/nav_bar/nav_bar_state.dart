part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}

final class Navigate extends NavBarState{}
final class LoadingNavState extends NavBarState{}
final class SuccessLogoutState extends NavBarState{}