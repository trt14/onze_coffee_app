import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({
    super.key,
    required this.imageSrc,
  });
  final String imageSrc;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(value: 1),
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primary, // Top half color
            Colors.white, // Bottom half color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
      ),
      child: Image.asset(imageSrc),
    );
  }
}
