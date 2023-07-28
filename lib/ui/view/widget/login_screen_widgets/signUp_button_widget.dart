import 'package:compare_app/ui/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';

Row signUpWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Hesabın yok mu?",
        style: TextStyle(color: Colors.white70),
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
        child:const Text(
          " Kaydol",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
