import '/ui/view/widget/signup_screen_widgets/warning_widget.dart';
import 'package:flutter/cupertino.dart';
import '../../screens/signup_screen.dart';
import 'generate_boarding_screen_widget.dart';

void signupTextFieldController(context) {
  if (currentPage == 0) {
    if (nameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        !RegExp(r'^[a-zA-ZğüşıöçĞÜŞİÖÇ]+( [a-zA-ZğüşıöçĞÜŞİÖÇ]+)*$')
            .hasMatch(nameController.text) ||
        !RegExp(r'^[a-zA-ZğüşıöçĞÜŞİÖÇ]+( [a-zA-ZğüşıöçĞÜŞİÖÇ]+)*$')
            .hasMatch(surnameController.text)) {
      warningWidget(context);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
  if (currentPage == 1) {
    if (emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(emailController.text) ||
        !RegExp(r'^[0-9]\d{9,14}$').hasMatch(phoneController.text)) {
      warningWidget(context);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
  if (currentPage == 2) {
    if (password1Controller.text.isEmpty ||
        password2Controller.text.isEmpty ||
        password1Controller.text != password2Controller.text ||
        !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
            .hasMatch(password1Controller.text)) {
      warningWidget(context);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
  if (currentPage == 3 || currentPage == 4 || currentPage == 5) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
