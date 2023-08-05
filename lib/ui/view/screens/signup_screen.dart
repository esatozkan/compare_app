import 'package:compare_app/data/constans/constans.dart';
import 'package:compare_app/ui/view/widget/signup_screen_widgets/generate_boarding_screen_widget.dart';
import 'package:flutter/material.dart';
import '../widget/signup_screen_widgets/signup_control_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

int currentPage = 0;
PageController pageController = PageController(initialPage: 0);

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              currentPage = 0;
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: signScreenItemColor,
            ),
          ),
          title: Text(
            "Kaydol",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: signScreenItemColor,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: signScreenBackgroundColor,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * .12,
              20,
              0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: getInformation.length,
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(
                        () {
                          currentPage = index;
                        },
                      );
                    },
                    itemBuilder: (context, index) => getInformation[index],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: controlButtonWidget(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
