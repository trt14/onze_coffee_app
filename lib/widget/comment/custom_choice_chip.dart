
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    this.onSelected,
    required this.selected,
    required this.text,
  });
  final Function(bool)? onSelected;
  final bool selected;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ChoiceChip(
        label: Text(
            style: TextStyle(color: selected ? AppColor.white : AppColor.black),
            text),
        selected: selected,
        selectedColor: AppColor.secondary,
        onSelected: onSelected,
        showCheckmark: false,
      ),
    );
  }
}
