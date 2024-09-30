import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/custom_choice_chip.dart';
import 'package:onze_coffee_app/widget/custom_container_order.dart';

class EmpHomeScreen extends StatelessWidget {
  const EmpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Order Status",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomChoiceChip(
                  title: "Hold",
                  isSelected: false,
                ),
                CustomChoiceChip(
                  title: "Accepted",
                  isSelected: true,
                  selectedColor: AppColor.secondary,
                  lblColor: AppColor.white,
                ),
                CustomChoiceChip(title: "Completed", isSelected: false),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onLongPress: () {
                      print("here");
                    },
                    child: const CustomContainerOrder(
                        isNote: true,
                        note: "Don't add milk to the coffee",
                        orderID: "217",
                        height: 100,
                        width: 0.65,
                        productsWithQuntity:
                            "Coffee Mocha x 1  ,  Coffee Mocha x 2  ,  Coffee Mocha x 1"),
                  ),
                  InkWell(
                    onTap: () {
                      print("Completed");
                    },
                    child: Container(
                      width: context.getWidth(value: 0.25),
                      height: 100,
                      color: AppColor.primary,
                      child: Image.asset("assets/images/onzo-icon.png"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      
    );
  }
}
