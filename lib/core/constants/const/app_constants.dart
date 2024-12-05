import 'package:get/get.dart';
import '../../extensions/build_context.dart';

import '../../../app/data/models/language_model.dart';
import '../../../app/data/models/onboarding_model.dart';
import '../../../gen/assets.gen.dart';

class AppConstants {
  static const String online = 'online';
  static const String cash = 'cash';
  static const String type = 'type';
  static const String user = 'user';
  static const String amount = 'amount';
  static const String userData = 'userData';
  static const String ar = 'ar';
  static const String en = 'en';
  static const String dateFormate = 'yyyy-MM-dd';
  static const String timeFormate = 'HH:mm';
  static const String dateOfBirthFormate = 'yyyy-MM-dd HH:mm';
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String relationMy = 'my';
  static const String appPhoneKey = '20';
  static const String appCountryKey = 'EG';
  static const String appCurrency = 'EGP';
  static const String failed = 'Failed';
  static const String completed = 'Completed';
  static const String delivered = 'Delivered';
  static const String paymentIdNotAvailable = 'PAYMENT_ID NOT AVAILABLE';
  static const String image = 'image';
  static const String body = 'body';
  String getAppCurrency() {
    return Get.context!.translate.currency;
  }

  List<String> getGenderList() {
    return [
      Get.context!.translate.male,
      Get.context!.translate.female,
    ];
  }

  List<LanguageModel> getLanguageList() {
    return [
      LanguageModel(
        imagePath: Assets.countries.usSvg.path,
        name: Get.context!.translate.english,
        code: en,
      ),
      LanguageModel(
        imagePath: Assets.countries.arSvg.path,
        name: Get.context!.translate.arabic,
        code: ar,
      ),
    ];
  }

  List<OnboardingModel> getOnboardingList() {
    return [
      OnboardingModel(
        image: Assets.images.onboarding1.path,
        title: "Order from your favourite stores or vendors",
      ),
      OnboardingModel(
        image: Assets.images.onboarding2.path,
        title: "Choose from a wide range of  delicious meals",
      ),
      OnboardingModel(
        image: Assets.images.onboarding3.path,
        title: "Enjoy instant delivery and payment",
      ),
    ];
  }
}
