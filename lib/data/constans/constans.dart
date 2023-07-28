import 'package:flutter/material.dart';

Gradient signScreenBackgroundColor = const LinearGradient(
  colors: [
    Color(0xFFCB2B93),
    Color(0xFF9546C4),
    Color(0xFF5E61F4),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

Image appLogo() {
  return Image.asset(
    "assets/app_logo.png",
    fit: BoxFit.cover,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}
