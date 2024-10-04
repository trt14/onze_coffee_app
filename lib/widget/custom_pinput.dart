import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:pinput/pinput.dart';

class CustomPinput extends StatelessWidget {
  const CustomPinput({
    super.key,
    this.onCompleted,
  });
  final void Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      onCompleted: onCompleted,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
            fontSize: 20, color: AppColor.white, fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
            fontSize: 20, color: AppColor.white, fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondary),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
