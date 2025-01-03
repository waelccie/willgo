import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:willgo/l10n/messages.dart';

class TranslationController extends GetxController {
  var currentLocale = const Locale('en').obs; 

  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    currentLocale.value = locale;
    Get.updateLocale(locale);
  }

  String get currentLanguage => currentLocale.value.languageCode;
}
