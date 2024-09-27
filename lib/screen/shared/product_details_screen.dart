import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                )
              ],
            ),
          )),
    );
  }
}

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.name,
    required this.type,
    required this.cal,
  });
  final String name;
  final String type;
  final String cal;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: context.getWidth(value: .5),
          child: ListTile(
            title: Text(name),
            subtitle: Text(type),
          ),
        ),
        const Icon(color: AppColor.secondary, Icons.fireplace_outlined),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
              style: const TextStyle(color: AppColor.secondary), "$cal Cal"),
        )
      ],
    );
  }
}
