import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/screen/employee/emp_home_screen.dart';
import 'package:onze_coffee_app/cubits/emp_products_screen.dart';
import 'package:onze_coffee_app/screen/shared/orders_screen.dart';

part 'admin_nav_state.dart';

class AdminNavCubit extends Cubit<AdminNavState> {
  AdminNavCubit() : super(AdminNavInitial());
  List<Widget> screens = const [
    EmpProductsScreen(),
    EmpHomeScreen(),
    OrdersScreen()
  ];

  List<PreferredSizeWidget> appBars = [
    AppBar(
      title: const Center(child: Text("Products")),
    ),
    AppBar(
      title: const Center(child: Text("Order")),
    ),
    AppBar(
      title: const Center(child: Text("Orders")),
    ),
  ];
  int index = 0;
  update() {
    emit(Navigate());
  }
}
