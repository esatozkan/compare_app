import 'package:flutter/material.dart';

Color signScreenBackgroundColor = Colors.black;

Image appLogo() {
  return Image.asset(
    "assets/app_logo.png",
    fit: BoxFit.cover,
    width: 250,
    height: 250,
    color: Colors.white,
  );
}
