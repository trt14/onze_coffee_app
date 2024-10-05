import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';

customLoading({required BuildContext context}) {
  showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => const SizedBox(
          height: 500, child: Center(child: CircularProgressIndicator())));
}

// customLoading({required BuildContext context}) {
//   return Center(
//     child: LoadingAnimationWidget.twistingDots(
//       leftDotColor: AppColor.primary,
//       rightDotColor: AppColor.secondary,
//       size: 100,
//     ),
//   );
// }
