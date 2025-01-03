import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:willgo/app/modules/profile/controllers/translation_controller.dart';
import 'package:willgo/core/services/network_service.dart/dio_network_service.dart';

import '../../../core/global/const.dart';
import '../../../core/services/get_storage_helper.dart';
import '../models/main_model.dart';

class GeneralApis {
  static Future<MainModel> storeFCMToken({
    required String fcm,
  }) async {
        final translationController = Get.find<TranslationController>();
    final request = NetworkRequest(
      
      path: APIKeys.storeFCMToken,
      type: NetworkRequestType.POST,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
          "lang": translationController.currentLocale.value.languageCode,
      },
      data: NetworkRequestBody.fromData(
        FormData.fromMap(
          {
            "fcm_token": fcm,
          },
        ),
      ),
    );
  
        log("Request Headers: ${request.headers}");

    final response = await networkService.execute(
      request,
      (parser) => MainModel.fromJson(parser),
    );
    var data = response.maybeWhen(
      ok: ((data) {
        return data;
      }),
      orElse: () {
        return null;
      },
      badRequest: (data) {
        return data;
      },
      created: (data) {
        return data;
      },
      unprocessableEntity: (data) {
        return data;
      },
      noAuth: (data) {
        return data;
      },
      conflict: (data) {
        return data;
      },
      invalidParameters: (data) {
        return data;
      },
      noAccess: (data) {
        return data;
      },
      noData: (message) {
        if (kDebugMode) {
          print(message);
        }
        BotToast.closeAllLoading();
      },
      notFound: (data) {
        return data;
      },
    );
    return data;
  }
}
