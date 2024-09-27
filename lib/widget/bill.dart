import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';

class Bill extends StatelessWidget {
  const Bill({
    super.key,
    required this.price,
  });
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.getHeight(value: .3),
          child: const ListTile(
            title: Text("Payment Summary"),
            subtitle: Text("Price"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "$price SAR",
            style: const TextStyle(
              color: AppColor.secondary,
            ),
          ),
        )
      ],
    );
  }
}
