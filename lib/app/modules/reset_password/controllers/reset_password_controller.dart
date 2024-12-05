import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/auth_apis.dart';
import 'package:willgo/app/widgets/loading_widget.dart';
import 'package:willgo/core/global/const.dart';

import '../../../../core/enums/enums.dart';
import '../../../data/parameters/auth/reset_password_parameters.dart';
import '../../../routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? phone;
  String? otp;
  @override
  void onInit() {
    phone = Get.arguments?["phone"];
    otp = Get.arguments?["otp"];

    super.onInit();
  }

  Future<void> resetPassword() async {
    if (!resetPasswordKey.currentState!.validate()) {
      return;
    }
    showLoading();
    var res = await AuthApis.resetPassword(
      parameters: ResetPasswordParameters(
        phone: phone ?? "",
        otp: otp ?? "",
        newPassword: newPasswordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      Get.offAllNamed(
        Routes.SUCCESS,
        arguments: {
          "successType": SuccessType.resetPassword,
        },
      );
    } else {
      showErrorsSequentially(res.errors ?? []);
      BotToast.closeAllLoading();
    }
  }
}
