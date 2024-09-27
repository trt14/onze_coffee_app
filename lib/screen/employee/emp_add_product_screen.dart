import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/custom_text_field.dart';

class EmpAddProductScreen extends StatelessWidget {
  const EmpAddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          leading: const Icon(Icons.arrow_back),
          title: const Center(child: Text("Add Product")),
        ),
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: context.getWidth(value: 90 / 100),
                  height: context.getHeight(value: 0.25),
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: const BoxDecoration(color: AppColor.fivth),
                  child: const Icon(Icons.add),
                ),
                CustomTextField(
                  title: "Product Name",
                  hint: "Product Name",
                ),
                CustomTextField(
                  title: "Product Description",
                  hint: "product description",
                  maxLines: 4,
                ),
                CustomTextField(
                  title: "Price",
                  hint: "Price",
                ),
                CustomTextField(
                  title: "Calories",
                  hint: "Calories",
                ),
              ],
            ),
          ),
        ));
  }
}
