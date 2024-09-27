import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(color: AppColor.white),
      ),
    );
  }
}
