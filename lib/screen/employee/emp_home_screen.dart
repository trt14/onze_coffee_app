import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/custom_choice_chip.dart';

class EmpHomeScreen extends StatelessWidget {
  const EmpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Order")),
      ),
      body: Padding(
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    width: context.getWidth(value: 0.65),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.centerLeft,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Order #217",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Coffee Mocha x 1  ,  Coffee Mocha x 2  ,  Coffee Mocha x 1",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Note:",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Don't add milk to the coffee",
                              style: TextStyle(
                                  fontSize: 10, color: AppColor.secondary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: context.getWidth(value: 0.25),
                    height: 100,
                    color: AppColor.primary,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
