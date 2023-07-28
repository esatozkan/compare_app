import 'package:compare_app/data/constans/constans.dart';
import 'package:compare_app/ui/provider/signup_screen_transition_provider.dart';
import 'package:compare_app/ui/view/widget/signup_screen_widgets/generate_boarding_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late PageController pageController;
  bool isVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SignUpScreenTransitionProvider signUpScreenTransitionProvider =
        Provider.of<SignUpScreenTransitionProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              signUpScreenTransitionProvider.resetIndex();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Kaydol",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: signScreenBackgroundColor,
          ),
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
                    itemCount: getInformation.length,
                    controller: pageController,
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

  Row controlButtonWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: isVisible,
          child: TextButton(
            onPressed: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            child: const Text(
              "Geri",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            controller: pageController,
            count: getInformation.length,
            effect: const WormEffect(
              spacing: 16,
              dotColor: Colors.white24,
              activeDotColor: Colors.white,
              dotWidth: 10,
              dotHeight: 10,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          child: const Text(
            "İleri",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
