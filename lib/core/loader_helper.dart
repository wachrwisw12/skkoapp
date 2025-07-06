import 'package:flutter/material.dart';

void showLoaderOverlay(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );
}

void hideLoaderOverlay(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
