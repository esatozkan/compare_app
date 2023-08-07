import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> warningWidget(
    context,String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      duration:const Duration(seconds: 1),
      content: Center(
        child: Text(text),
      ),
    ),
  );
}
