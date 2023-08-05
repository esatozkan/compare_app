import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> warningWidget(
    context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      duration: Duration(seconds: 1),
      content: Center(
        child: Text("Zorunlu alanları doğru şekilde doldurunuz"),
      ),
    ),
  );
}
