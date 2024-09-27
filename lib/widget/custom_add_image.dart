import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';

class CustomAddImage extends StatelessWidget {
  const CustomAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.getWidth(value: 90 / 100),
        height: context.getHeight(value: 0.25),
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: const BoxDecoration(color: AppColor.fivth),
        child: const Icon(Icons.add),
      ),
    );
  }
}
