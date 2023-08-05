import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../data/constans/constans.dart';
import '../../screens/signup_screen.dart';
import 'generate_boarding_screen_widget.dart';
import 'signup_textfield_controller.dart';

Row controlButtonWidget(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Visibility(
        visible: currentPage != 0 ? true : false,
        child: TextButton(
          onPressed: () {
            pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          child: Text(
            "Geri",
            style: TextStyle(
              fontSize: 18,
              color: signScreenItemColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Center(
        child: SmoothPageIndicator(
          controller: pageController,
          count: getInformation.length,
          effect:  WormEffect(
            spacing: 16,
            dotColor: Colors.white24,
            activeDotColor: signScreenItemColor,
            dotWidth: 10,
            dotHeight: 10,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          signupTextFieldController(context);
        },
        child: Text(
          currentPage == getInformation.length - 1 ? "Başla" : "İleri",
          style: TextStyle(
            color: signScreenItemColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
