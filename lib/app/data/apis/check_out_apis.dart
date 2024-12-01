import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/global/const.dart';
import '../../../core/services/get_storage_helper.dart';
import '../../../core/services/network_service.dart/dio_network_service.dart';
import '../models/check_outModel.dart';
import '../parameters/checkOut.dart';

class CheckApis {
  static Future<CheckOutModel> makeOrder({
    required PaymentParameters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.checkOut,
      type: NetworkRequestType.POST,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,
      },
      data: NetworkRequestBody.fromData(
        FormData.fromMap(parameters.toMap()),
      ),
    );

    final response = await networkService.execute(
      request,
      (parser) => CheckOutModel.fromJson(parser),
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
      unprocessableEntity: (data) {
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
