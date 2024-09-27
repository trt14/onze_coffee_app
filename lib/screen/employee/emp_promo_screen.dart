import 'package:flutter/material.dart';
import 'package:onze_coffee_app/widget/custom_add_image.dart';

class EmpPromoScreen extends StatelessWidget {
  const EmpPromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add Promo Image"),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomAddImage(),
        ],
      ),
    );
  }
}
