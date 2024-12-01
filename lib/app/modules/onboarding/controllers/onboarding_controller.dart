import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  int index = 0;
  PageController pageController = PageController();
  void onCnahgeOnBoardingIndex(int value) {
    index = value;
    update();
  }
}
