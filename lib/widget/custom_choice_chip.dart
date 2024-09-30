import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key,
      required this.title,
      required this.isSelected,
      this.lblColor = AppColor.primary,
      this.selectedColor = AppColor.forth,
      this.backgroundColor = AppColor.white, this.onSelected});
  final String title;
  final bool isSelected;
  final Color selectedColor;
  final Color backgroundColor;
  final Color lblColor;
  final Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(title),
      selected: isSelected,
      selectedColor: selectedColor,
      backgroundColor: backgroundColor,
      side: BorderSide(
          color: isSelected == true ? lblColor : AppColor.fivth,
          width: isSelected == true ? 2 : 1),
      labelStyle:
          TextStyle(color: isSelected == true ? lblColor : AppColor.black),
      showCheckmark: false,
      onSelected: onSelected,
    );
  }
}
