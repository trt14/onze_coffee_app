import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/widget/comment/custom_choice_chip.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColor.primary),
                child: Image.asset("assets/logo/onze_logo.png"),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomChoiceChip(
                      selected: true,
                      text: "All Coffee",
                      onSelected: (bool value) {},
                    ),
                    CustomChoiceChip(
                      selected: false,
                      text: "Black",
                      onSelected: (bool value) {},
                    ),
                    CustomChoiceChip(
                      selected: false,
                      text: "Spanish",
                      onSelected: (bool value) {},
                    ),
                    CustomChoiceChip(
                      selected: false,
                      text: "Choclete",
                      onSelected: (bool value) {},
                    ),
                  ],
                ),
              ),
              ProductView(
                name: "Caffe Mocha",
                price: "10",
                type: "Deep Foam",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    this.imageSrc = "",
    required this.name,
    required this.type,
    required this.price,
  });
  final String? imageSrc;
  final String name;
  final String type;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 40,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(height: 40, width: 40, child: const Placeholder()),
              ListTile(
                title: Text(name),
                subtitle: Text(type),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(style: TextStyle(color: AppColor.secondary), "$price SAR")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
