import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(title),
      selected: isSelected,
      selectedColor: AppColor.forth,
      backgroundColor: AppColor.white,
      side: BorderSide(
          color: isSelected == true ? AppColor.primary : AppColor.fivth,
          width: isSelected == true ? 2 : 1),
      labelStyle: TextStyle(
          color: isSelected == true ? AppColor.primary : AppColor.black),
      showCheckmark: false,
      onSelected: (value) {},
    );
  }
}
