import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/custom_choice_chip.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  width: context.getWidth(value: 90 / 100),
                  height: context.getHeight(value: 0.25),
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: const BoxDecoration(color: AppColor.fivth),
                  child: const Icon(Icons.add),
                ),
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hot/Cold",
                      style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        ChoiceChip(
                          label: const Text("Hot"),
                          selected: true,
                          selectedColor: AppColor.forth,
                          side: const BorderSide(
                              color: AppColor.primary, width: 2),
                          labelStyle: const TextStyle(color: AppColor.primary),
                          showCheckmark: false,
                          onSelected: (value) {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CustomChoiceChip(title: "Cold", isSelected: false)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Category",
                          style: TextStyle(
                              color: AppColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.primary),
                          child: const Icon(
                            Icons.add,
                            size: 14,
                            color: AppColor.white,
                          ),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        CustomChoiceChip(title: "Machiatto", isSelected: true),
                        SizedBox(
                          width: 10,
                        ),
                        CustomChoiceChip(title: "Latte", isSelected: false),
                        SizedBox(
                          width: 10,
                        ),
                        CustomChoiceChip(title: "Americano", isSelected: false),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Add Product",
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
