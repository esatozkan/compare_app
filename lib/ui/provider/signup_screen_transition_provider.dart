import 'package:compare_app/data/repository/increment_decrement_reset_repository.dart';
import 'package:flutter/material.dart';

class SignUpScreenTransitionProvider extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);

  late int signUpPageIndex = pageController.initialPage;

  int get getSignUpPageIndex => signUpPageIndex;

  IncremetDecrementResetRepository incremetDecrementResetRepository =
      IncremetDecrementResetRepository();

  void incrementIndex() {
    signUpPageIndex =
        incremetDecrementResetRepository.incrementValue(signUpPageIndex);
    notifyListeners();
  }

  void decrementIndex() {
    signUpPageIndex =
        incremetDecrementResetRepository.decrementValue(signUpPageIndex);
    notifyListeners();
  }

  void resetIndex() {
    signUpPageIndex =
        incremetDecrementResetRepository.resetValue(signUpPageIndex);
    notifyListeners();
  }
}
