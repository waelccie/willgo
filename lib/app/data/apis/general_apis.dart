import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:willgo/core/services/network_service.dart/dio_network_service.dart';

import '../../../core/global/const.dart';
import '../../../core/services/get_storage_helper.dart';
import '../models/main_model.dart';

class GeneralApis {
  static Future<MainModel> storeFCMToken({
    required String fcm,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.storeFCMToken,
      type: NetworkRequestType.POST,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,
      },
      data: NetworkRequestBody.fromData(
        FormData.fromMap(
          {
            "fcm_token": fcm,
          },
        ),
      ),
    );
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
