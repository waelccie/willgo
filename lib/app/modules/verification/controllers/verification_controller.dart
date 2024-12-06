import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/auth_apis.dart';
import 'package:willgo/app/routes/app_pages.dart';
import 'package:willgo/app/widgets/loading_widget.dart';
import 'package:willgo/core/global/const.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../data/parameters/auth/sendVerifyOtp.dart';
import '../../../data/parameters/auth/send_otp_pararmeters.dart';
import '../../../data/parameters/auth/verify_otp_parameters.dart';

class VerificationController extends GetxController {
  VerifictionType? type;
  GlobalKey<FormState> verifyOtpKey = GlobalKey<FormState>();
  String? phone;
  String? otp;
  String? name;
  String? email;
  String? password;
  String? password_confirmation;
  bool? terms;

  void onChangeOtpCode(String val) {
    otp = val;
    update();
  }

  @override
  void onInit() {
    type = Get.arguments?["type"];
    phone = Get.arguments?["phone"];
    name = Get.arguments?['name'];
    email = Get.arguments?['email'];
    password = Get.arguments?['password'];
    password_confirmation = Get.arguments?['password_confirmation'];
    terms = Get.arguments?['terms'];
    startTimer();

  }

  Future<void> verifyOtp() async {
    print(type);
    if (type == VerifictionType.verifyPhone) {
      _verifyRegisterOtp();
    } else if (type == VerifictionType.reset_password) {
      _verifyForgetPasswordOtp();
    }
  }

  Future<void> _verifyRegisterOtp() async {
    if (!verifyOtpKey.currentState!.validate() || otp == null) {
      return;
    }
    showLoading();
    var res = await AuthApis.RegisterAfterOtp(
      parameters: VerifyOtpParameters(
          phone: "+20$phone" ?? "",
          otp: otp ?? "",
          name: name ?? "",
          email: email ?? "",
          password: password ?? "",
          passwordConfirmation: password_confirmation ?? "",
          terms: terms
      ),
    );
    if (res.success == true) {
      await CacheHelper.cacheToken(token: res.data!.token ?? "");

      update();
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      Get.offAllNamed(
        Routes.SUCCESS,
        arguments: {
          "successType": SuccessType.verifyPhone,
        },
      );
    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }

  Future<void> _verifyForgetPasswordOtp() async {
    if (!verifyOtpKey.currentState!.validate() || otp == null) {
      return;
    }
    showLoading();
    var res = await AuthApis.vrifyOtpresetPassword(
      parameters: OtpParameters (
        phone: phone ?? "",
        otp: otp ?? "",


      ),
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
      Get.offAllNamed(
        Routes.RESET_PASSWORD,
        arguments: {

          "phone": phone,
          "otp":otp
        },
      );
    } else {
      showErrorsSequentially(res.errors ?? []);
      print(phone);
      print(otp);
      print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
      BotToast.closeAllLoading();
    }
  }

  late Timer _timer;
  int remainingSeconds = 80; // 1 minute 20 seconds = 80 seconds

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        update();
      } else {
        _timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }



  Future<void> resendOtpCode() async {
    showLoading();
    var res = await AuthApis.sendOtp(
      parameters: SendOtpPararmeters(phone: phone ?? "",),
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
    } else {
      showErrorsSequentially(res.errors ?? []);
      BotToast.closeAllLoading();
    }
  }

}