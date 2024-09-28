import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/comment/custom_pay_details_bottom_sheet.dart';
import 'package:onze_coffee_app/widget/comment/product_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const CustomPayDetailsBottomSheet(
        price: "10",
      ),
      appBar: AppBar(
        title: const Center(
          child: Text("Order details"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const Center(
                child: Text("Order # 217"),
              ),
              const SizedBox(
                height: 30,
              ),
              //progress indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //status
                  Column(
                    children: [
                      const Text("holding"),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: context.getWidth(value: .2),
                        height: context.getHeight(value: .006),
                        child: const LinearProgressIndicator(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          value: 1,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      const Text("Processing"),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: context.getWidth(value: .2),
                        height: context.getHeight(value: .006),
                        child: const LinearProgressIndicator(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          value: 1,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      const Text("Complete"),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: context.getWidth(value: .2),
                        height: context.getHeight(value: .006),
                        child: const LinearProgressIndicator(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          value: 1,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProductCard(
                  qty: "2",
                  enable: false,
                  imageSrc: "assets/product/image.png",
                  name: "Coffee Mocha",
                  type: "Deep Foam",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    style: TextStyle(fontWeight: FontWeight.bold), "Note:"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                      style: TextStyle(color: AppColor.secondary),
                      "Do not add milk to the coffee "),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
