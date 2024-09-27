import 'package:flutter/material.dart';
import 'package:onze_coffee_app/widget/comment/custom_button_bottom_sheet.dart';
import 'package:onze_coffee_app/widget/product_description.dart';
import 'package:onze_coffee_app/widget/product_title.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Detail")),
      ),
      bottomSheet: CustomButtonBottomSheet(
        title: "Add to Cart",
        price: "10",
        onPressed: () {},
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/product/image.png"),
              const ProductTitle(
                name: "Coffee Mocha",
                cal: "5",
                type: "Hot",
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Divider(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      "Description"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ProductDescription(
                description:
                    "Flutter is Google's mobile Ul open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase",
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("scolling images")
            ],
          ),
        ),
      ),
    );
  }
}
