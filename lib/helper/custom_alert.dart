import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

showAlertSnackBar(
    {required BuildContext context,
    required Color color,
    required String title,
    required Color colorStatus}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(
      child: Text(
        title,
        style: const TextStyle(color: AppColor.white),
      ),
    ),
    backgroundColor: colorStatus,
  ));
}
