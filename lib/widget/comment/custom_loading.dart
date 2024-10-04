import 'package:flutter/material.dart';

customLoading({required BuildContext context}) {
  showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => const SizedBox(
          height: 500, child: Center(child: CircularProgressIndicator())));
}
