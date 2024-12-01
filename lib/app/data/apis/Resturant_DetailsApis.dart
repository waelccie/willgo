import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:willgo/app/data/models/Resturant_details.dart';

import '../../../core/global/const.dart';
import '../../../core/services/get_storage_helper.dart';
import '../../../core/services/network_service.dart/dio_network_service.dart';
import '../models/product_model.dart';

class ResurantDetailsApi{
  static Future<ResturantDetailsModel> get_Resturant_Details(id) async {
    final request = NetworkRequest(
      path: APIKeys.getRestaurantDetail(id),
      type: NetworkRequestType.GET,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,

      },
      queryParams: {

      },
      data: const NetworkRequestBody.empty(),
    );
    final response = await networkService.execute(
      request,
          (parser) => ResturantDetailsModel.fromJson(parser),
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


  static Future<ResturantProductModel> get_Resturant_products(id) async {
    final request = NetworkRequest(
      path: APIKeys.getProducts,
      type: NetworkRequestType.GET,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,

      },
      queryParams: {
       "restaurant_id":id

      },
      data: const NetworkRequestBody.empty(),
    );
    final response = await networkService.execute(
      request,
          (parser) => ResturantProductModel.fromJson(parser),
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