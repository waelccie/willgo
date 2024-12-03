import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:willgo/app/data/apis/auth_apis.dart';
import 'package:willgo/app/widgets/loading_widget.dart';

import '../../../../core/global/const.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../data/parameters/auth/login_parameters.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {


  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  void onChangeRememberMe(bool? value) {
    rememberMe = value!;
    update();
  }


  String phoneKey = "+20";
  onChangePhoneKey(Country val) {
    phoneKey = "+${val.dialCode}";
    update();
  }

  Future<void> login() async {
    if (!loginKey.currentState!.validate()) {
      return;
    }
    showLoading();
    var res = await AuthApis.login(
      parameters: LoginParameters(
        password: passwordController.text,
        phone: phoneKey + phoneController.text,
        remember: rememberMe,
      ),
    );
    if (res.success == true) {
      await CacheHelper.cacheToken(token: res.data?.token ?? "");
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      Get.offAllNamed(Routes.NAV_SCREEN);
    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }
}
