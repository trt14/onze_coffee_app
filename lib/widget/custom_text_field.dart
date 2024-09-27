import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.title,
      this.controller,
      this.icon,
      this.isPassword = false,
      this.keyboardType,
      this.inputFormatters,
      this.maxLines = 1,
      this.errorText,
      this.hint,
      this.readOnly = false});
  final String title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final int? maxLines;
  bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.w500),
                )),
            TextField(
                readOnly: readOnly,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                obscureText: isPassword!,
                maxLines: maxLines,
                controller: controller,
                decoration: InputDecoration(
                  errorText: errorText,
                  labelStyle: const TextStyle(color: AppColor.primary),
                  filled: true,
                  fillColor: AppColor.fivth,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                    ),
                  ),
                  hintText: hint,
                  suffixIcon: icon,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
