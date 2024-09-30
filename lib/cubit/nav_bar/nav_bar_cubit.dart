import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/screen/shared/orders_screen.dart';
import 'package:onze_coffee_app/screen/user/user_home_screen.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  List<Widget> screens = [
    UserHomeScreen(),
    OrdersScreen(),
  ];
  int index = 0;
  NavBarCubit() : super(NavBarInitial());

  update() {
    emit(Navigate());
  }
}
