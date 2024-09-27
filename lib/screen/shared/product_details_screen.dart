import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Detail")),
      ),
      bottomSheet: Buy(
        price: "10",
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
              const Text(
                  style: TextStyle(fontWeight: FontWeight.bold), "Description"),
              const Description(
                description:
                    "Flutter is Google's mobile Ul open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Buy extends StatelessWidget {
  const Buy({
    super.key,
    required this.price,
  });
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(value: .15),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: context.getHeight(value: 1),
            width: context.getWidth(value: .3),
            child: ListTile(
              titleTextStyle: const TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text("Price"),
              ),
              subtitleTextStyle: const TextStyle(
                  color: AppColor.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              subtitle: Text("$price SAR"),
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ReadMoreText(
        description,
        trimMode: TrimMode.Line,
        trimLines: 2,
        colorClickableText: AppColor.secondary,
        trimCollapsedText: 'Read More',
        trimExpandedText: 'Show less',
        moreStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.secondary),
      ),
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
        Row(
          children: [
            const Icon(color: AppColor.secondary, FontAwesomeIcons.fire),
            const SizedBox(width: 3),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                  style: const TextStyle(color: AppColor.secondary),
                  "$cal Cal"),
            )
          ],
        )
      ],
    );
  }
}
