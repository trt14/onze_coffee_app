import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/custom_choice_chip.dart';

class CustomContainerOrder extends StatelessWidget {
  const CustomContainerOrder(
      {super.key,
      required this.orderID,
      required this.productsWithQuntity,
      this.width = 0.65,
      this.height = 100,
      this.isNote = true,
      this.statusColor = AppColor.primary,
      this.price = 1,
      this.textStatus = "Holding",
      this.note});
  final String orderID;
  final String productsWithQuntity;
  final String? note;
  final bool isNote;
  final Color statusColor;
  final double width;
  final double height;
  final double? price;
  final String? textStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: context.getWidth(value: width),
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order #$orderID",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productsWithQuntity,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          isNote == true
              ? const Row(
                  children: [
                    Text(
                      "Note:",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Don't add milk to the coffee",
                      style: TextStyle(fontSize: 10, color: AppColor.secondary),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomChoiceChip(
                      title: textStatus.toString(),
                      isSelected: true,
                      selectedColor: statusColor,
                      lblColor: Colors.white,
                    ),
                    Text(
                      "$price SAR",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColor.secondary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
