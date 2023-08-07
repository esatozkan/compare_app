import 'package:compare_app/ui/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../../data/constans/constans.dart';

Row signUpWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       Text(
        "Hesabın yok mu?",
        style: TextStyle(color: signScreenSecondItemColor),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ),
          );
        },
        child: Text(
          " Kaydol",
          style: TextStyle(
            color: signScreenItemColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
