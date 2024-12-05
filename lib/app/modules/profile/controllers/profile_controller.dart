import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:willgo/app/data/apis/auth_apis.dart';
import 'package:willgo/app/modules/home/controllers/home_controller.dart';
import 'package:willgo/app/routes/app_pages.dart';
import 'package:willgo/app/widgets/loading_widget.dart';
import 'package:willgo/core/global/const.dart';
import 'package:willgo/core/services/get_storage_helper.dart';
import '../../../data/apis/user_apis.dart';
import '../../../data/models/user_model.dart';
import '../../../data/parameters/updateUser.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    getUserData = UserApis.getUserData();
    super.onInit();
  }

  var name = TextEditingController();
  var date = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  File? imgFile;
  DateTime? selectedDate;
  void takeSnapshot() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (img == null) return;
    imgFile = File(img.path);
  }

  late Future<UserModel> getUserData;

  Future<void> logout() async {
    showLoading();
    var res = await AuthApis.logout();
    if (res.success == true) {
      await CacheHelper.logout();
      BotToast.closeAllLoading();
      Get.offAllNamed(Routes.AUTH);
      BotToast.showText(text: res.message ?? "");
    } else {
      await CacheHelper.logout();
      BotToast.closeAllLoading();
      Get.offAllNamed(Routes.AUTH);
      showErrorsSequentially(res.errors ?? []);
    }
  }

  Future<void> deleteAccount() async {
    showLoading();
    var res = await AuthApis.deleteAccount();
    if (res.success == true) {
      await CacheHelper.logout();
      BotToast.closeAllLoading();
      Get.offAllNamed(Routes.AUTH);
      BotToast.showText(text: res.message ?? "");
    } else {
      await CacheHelper.logout();
      BotToast.closeAllLoading();
      Get.offAllNamed(Routes.AUTH);
      showErrorsSequentially(res.errors ?? []);
    }
  }

  Future<void> updateprofile() async {
    showLoading();
    var res = await AuthApis.updateProfile(
        parameters:
            UserUpdate(name: name.text, phone: phone.text, email: email.text));
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");
    } else {
      showErrorsSequentially(res.errors ?? []);

      BotToast.closeAllLoading();
    }
  }
}
