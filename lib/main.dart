import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/screen/shared/order_details_screen.dart';
import 'package:onze_coffee_app/screen/shared/product_details_screen.dart';
import 'package:onze_coffee_app/screen/user/user_cart_screen.dart';
import 'package:onze_coffee_app/screen/user/user_payment_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onze_coffee_app/screen/employee/emp_add_product_screen.dart';
import 'package:onze_coffee_app/screen/employee/emp_home_screen.dart';
import 'package:onze_coffee_app/screen/employee/emp_products_screen.dart';
import 'package:onze_coffee_app/screen/employee/emp_promo_screen.dart';
import 'package:onze_coffee_app/screen/shared/orders_screen.dart';
import 'package:onze_coffee_app/screen/user/user_home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'integrations/supabase/supabase_client.dart';

void main() async {
  // To initialize Flutter's
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from the .env file
  await dotenv.load();

  // Initialize Supabase
   supabase = await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'] ?? '',
      anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
    );

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
        debugShowCheckedModeBanner: false, home: EmpProductsScreen());
  }
}
