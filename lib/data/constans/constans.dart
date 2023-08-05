import 'package:flutter/material.dart';

Image appLogo(context) {
  return Image.asset(
    "assets/app_logo.png",
    fit: BoxFit.cover,
    width: MediaQuery.of(context).size.width * .581,
    height: MediaQuery.of(context).size.height * .268,
    color: Colors.white,
  );
}

Color signScreenBackgroundColor = Colors.black;
Color signScreenItemColor = Colors.white;
Color signScreenSecondItemColor = Colors.white70;
