import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/screen/employee/emp_add_product_screen.dart';
import 'package:onze_coffee_app/screen/employee/emp_home_screen.dart';
import 'package:onze_coffee_app/screen/user/user_home_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MainApp(), // Wrap your app
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: UserHomeScreen());
  }
}
