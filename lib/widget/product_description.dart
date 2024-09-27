
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:readmore/readmore.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
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
