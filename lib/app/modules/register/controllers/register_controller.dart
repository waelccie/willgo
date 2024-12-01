import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:willgo/app/data/apis/auth_apis.dart';
import 'package:willgo/app/widgets/loading_widget.dart';
import 'package:willgo/core/global/const.dart';

import '../../../../core/enums/enums.dart';
import '../../../data/parameters/auth/register_parameters.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool termsAndConditions = false;
  void onChangeTermsAndConditions(bool? value) {
    termsAndConditions = value!;
    update();
  }

  String phoneKey = "+20";
  onChangePhoneKey(Country val) {
    phoneKey = "+${val.dialCode}";
    update();
  }

  Future<void> register() async {
    if (!registerKey.currentState!.validate()) {
      return;
    }
    showLoading();
    var res = await AuthApis.register(
      parameters: RegisterParameters(
        email: emailController.text,
        name: userController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        phone: phoneKey + phoneController.text,
        terms: termsAndConditions,
      ),
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      Get.toNamed(
        Routes.VERIFICATION,
        arguments: {
          "type": VerifictionType.verifyPhone,
          "phone": phoneController.text,
          "token": res.data?.token ?? "",
          "name" : userController.text,
          "email" : emailController.text,
          "password" : passwordController.text,
          "password_confirmation" : confirmPasswordController.text,
          "terms" : termsAndConditions,
        },

      );
      print(
        termsAndConditions,
     );
    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }
}
