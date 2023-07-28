import 'package:compare_app/ui/view/widget/login_screen_widgets/custom_signIn_signUp_button.dart';
import 'package:compare_app/ui/view/widget/login_screen_widgets/custom_text_field.dart';
import 'package:compare_app/ui/view/widget/login_screen_widgets/signUp_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../data/constans/constans.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: signScreenBackgroundColor,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * .1,
                20,
                0,
              ),
              child: Column(
                children: [
                  appLogo(),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    text: " E-posta Adresinizi Giriniz ",
                    isPasswordType: false,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    isIcon: true,
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    text: " Şifrenizi Giriniz ",
                    isPasswordType: true,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    isIcon: true,
                    icon: Icons.lock,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customSignInSignUpButton(
                    context,
                    true,
                    () {},
                  ),
                  signUpWidget(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
