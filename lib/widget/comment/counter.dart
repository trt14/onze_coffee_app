
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    this.increment,
    this.decrement,
  });
  final void Function()? increment;
  final void Function()? decrement;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: increment,
          icon: const Icon(
            Icons.remove_circle,
            color: AppColor.secondary,
          ),
        ),
        const Text("1"),
        IconButton(
          onPressed: decrement,
          icon: const Icon(
            Icons.add_circle,
            color: AppColor.primary,
          ),
        )
      ],
    );
  }
}
