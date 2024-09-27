import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/widget/comment/custom_button_bottom_sheet.dart';
import 'package:onze_coffee_app/widget/custom_add_image.dart';
import 'package:onze_coffee_app/widget/image_banner.dart';

class EmpPromoScreen extends StatelessWidget {
  const EmpPromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add Promo Image"),
        ),
      ),
      bottomSheet: CustomButtonBottomSheet(
        title: "Add Promo",
        onPressed: () {},
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomAddImage(),
          SizedBox(
            height: 20,
          ),
          ImageBanner(
            imageSrc: "assets/banner/Banner.png",
            firstColor: AppColor.forth,
            seconedColor: AppColor.forth,
            width: 0.9,
          ),
        ],
      ),
    );
  }
}
