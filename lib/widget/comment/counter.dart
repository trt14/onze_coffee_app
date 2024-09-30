import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    this.increment,
    this.decrement,
    required this.qty,
  });
  final void Function()? increment;
  final void Function()? decrement;
  final String qty;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: decrement,
          icon: const Icon(
            Icons.remove_circle,
            color: AppColor.secondary,
          ),
        ),
        Text(qty),
        IconButton(
          onPressed: increment,
          icon: const Icon(
            Icons.add_circle,
            color: AppColor.primary,
          ),
        )
      ],
    );
  }
}
