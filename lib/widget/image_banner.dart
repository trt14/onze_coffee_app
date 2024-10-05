import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner(
      {super.key,
      required this.imageSrc,
      this.firstColor = AppColor.primary,
      this.width = 1,
      this.seconedColor = AppColor.white});
  final String imageSrc;
  final Color firstColor;
  final Color seconedColor;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(value: width),
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            firstColor, // Top half color
            seconedColor, // Bottom half color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.5, 0.5],
        ),
      ),
      child: Image.asset(imageSrc),
    );
  }
}
