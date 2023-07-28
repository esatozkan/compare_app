import 'package:flutter/material.dart';
import 'package:compare_app/ui/view/widget/login_screen_widgets/custom_text_field.dart';

class OnBoardingScreen extends StatelessWidget {
  final String image;
  final CustomTextField textField1;
  final CustomTextField textField2;
  const OnBoardingScreen({
    Key? key,
    required this.image,
    required this.textField1,
    required this.textField2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Image.asset(
              image,
              height: 250,
              width: 300,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            textField1,
            const SizedBox(
              height: 20,
            ),
            textField2,
          ],
        ),
      ),
    );
  }
}
