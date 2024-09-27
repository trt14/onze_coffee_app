import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';

class CustomButtonBottomSheet extends StatelessWidget {
  const CustomButtonBottomSheet({
    super.key,
    this.price = "",
    this.onPressed,
  });
  final String? price;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(value: .15),
      decoration: const BoxDecoration(
        color: Color(0xfffff8ff),
      ),
      child: price != ""
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ),
                Align(
                    alignment: Alignment.center,
                    child: CustomMainButton(
                        title: "Add to cart", onPressed: onPressed))
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomMainButton(
                  title: "Buy",
                  onPressed: onPressed,
                ),
              ],
            ),
    );
  }
}
