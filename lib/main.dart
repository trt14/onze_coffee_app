import 'package:flutter/material.dart';
import 'package:onze_coffee_app/screen/employee/emp_add_product_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: EmpAddProductScreen());
  }
}
