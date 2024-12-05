import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:willgo/app/data/models/add_support_request_model.dart';
import 'package:willgo/app/data/models/get_support_requests_model.dart';
import 'package:willgo/app/data/parameters/support_request/support_request_parameters.dart';
import 'package:willgo/core/global/const.dart';
import 'package:willgo/core/services/get_storage_helper.dart';
import 'package:willgo/core/services/network_service.dart/dio_network_service.dart';

class SupportRequestApis {
  static Future<SupportRequestsResponse> get_SupportRequests() async {
    final request = NetworkRequest(
      path: APIKeys.SupportRequests,
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
      (parser) => SupportRequestsResponse.fromJson(parser), 
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
    static Future<AddSupportRequestsResponse?> addSupportRequest({ 
    required SupportRequestParameters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.SupportRequests, 
      type: NetworkRequestType.POST,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,
      },
      data: NetworkRequestBody.raw(
        parameters.toMap(),
      ),
    );
    final response = await networkService.execute(
      request,
      (parser) => AddSupportRequestsResponse.fromJson(parser), 
    );
    var data = response.maybeWhen(
      ok: ((data) {
        return data;
      }),
      orElse: () {
        return null;
      },
      badRequest: (data) {
        BotToast.showText(text: "Bad Request: ${data.toString()}");
        return data;
      },
      created: (data) {
        return data;
      },
      noAuth: (data) {
        BotToast.showText(text: "Unauthorized access.");
        return data;
      },
      conflict: (data) {
        BotToast.showText(text: "Conflict error: ${data.toString()}");
        return data;
      },
      invalidParameters: (data) {
        BotToast.showText(text: "Invalid parameters: ${data.toString()}");
        return data;
      },
      noAccess: (data) {
        BotToast.showText(text: "No access rights.");
        return data;
      },
      unprocessableEntity: (data) {
        BotToast.showText(text: "Unprocessable Entity: ${data.toString()}");
        return data;
      },
      noData: (message) {
        if (kDebugMode) {
          print(message);
        }
        BotToast.closeAllLoading();
      },
      notFound: (data) {
        BotToast.showText(text: "Resource not found.");
        return data;
      },
    );

    if ( data.success == true) {
      BotToast.showText(text: "Added successfully.");
    } 

    return data;
  }
}
