import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:willgo/core/global/const.dart';
import 'package:willgo/core/services/get_storage_helper.dart';

import '../../../core/services/network_service.dart/dio_network_service.dart';
import '../models/user_model.dart';

class UserApis {
  static Future<UserModel> getUserData() async {
    final request = NetworkRequest(
      path: APIKeys.getUserData,
      type: NetworkRequestType.GET,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,
      },
      data: const NetworkRequestBody.empty(),
    );
    final response = await networkService.execute(
      request,
      (parser) => UserModel.fromJson(parser),
    );
    var data = response.maybeWhen(
      ok: ((data) {
           if (data?.data?.email != null) {
          CacheHelper.cacheEmail (email: data?.data?.email?? "");
        }
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
