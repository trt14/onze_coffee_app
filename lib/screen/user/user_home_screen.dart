import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/screen/shared/product_details_screen.dart';
import 'package:onze_coffee_app/widget/comment/custom_choice_chip.dart';
import 'package:onze_coffee_app/widget/comment/product_view.dart';
import 'package:onze_coffee_app/widget/image_banner.dart';

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
                width: context.getWidth(value: 1),
                height: context.getWidth(value: 1),
                decoration: const BoxDecoration(color: AppColor.primary),
                child: Image.asset("assets/logo/onze_logo.png"),
              ),
              const ImageBanner(imageSrc: "assets/banner/Banner.png"),
              const SizedBox(
                height: 10,
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
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: .75),
                children: [
                  ProductView(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailsScreen(),
                        ),
                      );
                    },
                    onPressed: () {},
                    name: "Coffee Mocha",
                    price: "10",
                    type: "Deep Foam",
                  ),
                  ProductView(
                    onTap: () {},
                    onPressed: () {},
                    name: "Coffee Mocha",
                    price: "10",
                    type: "Deep Foam",
                  ),
                  ProductView(
                    onTap: () {},
                    onPressed: () {},
                    name: "Black Coffee",
                    price: "10",
                    type: "Deep Foam",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
