
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';

class CustomPayDetailsBottomSheet extends StatelessWidget {
  const CustomPayDetailsBottomSheet({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(value: .15),
      decoration: const BoxDecoration(
        color: Color(0xfffff8ff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 15),
            child: Text(
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                "Payment Summary"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 15),
                child: Text(
                    style: TextStyle(color: AppColor.black, fontSize: 20),
                    "Price"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 15),
                child: Text(
                    style: const TextStyle(
                        color: AppColor.secondary, fontSize: 20),
                    "$price SAR"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
