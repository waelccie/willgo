import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:willgo/app/data/parameters/auth/send_otp_pararmeters.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/global/const.dart';
import '../../../data/apis/auth_apis.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/loading_widget.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  String phoneKey = "+20";
  onChangePhoneKey(Country val) {
    phoneKey = "+${val.dialCode}";
    update();
  }

  Future<void> sendOtpCode() async {
    if (!forgetPasswordKey.currentState!.validate()) {
      return;
    }
    showLoading();
    var res = await AuthApis.sendOtp(
      parameters: SendOtpPararmeters(phone: phoneController.text),
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      Get.toNamed(
        Routes.VERIFICATION,
        arguments: {
          "type": VerifictionType.reset_password,
          "phone": phoneKey + phoneController.text,
        },
      );
    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }
}
