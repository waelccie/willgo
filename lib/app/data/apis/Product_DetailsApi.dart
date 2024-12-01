import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/global/const.dart';
import '../../../core/services/get_storage_helper.dart';
import '../../../core/services/network_service.dart/dio_network_service.dart';
import '../models/addTocart.dart';
import '../models/cart.dart';
import '../models/product_details.dart';
import '../parameters/cart/add to cart.dart';

class ProductDetailsApi{

  static Future<ProductDetails> getProductsDetails(id) async {
    final request = NetworkRequest(
      path: APIKeys.getProductDetail(id),
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
          (parser) => ProductDetails.fromJson(parser),
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


  static Future<AddSucessfully> addToCart({
    required CartParameters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.addToCart,  // Update this path to your cart endpoint
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
          (parser) => AddSucessfully.fromJson(parser),
    );

    var data = response.maybeWhen(
      ok: ((data) => data),
      badRequest: (data) => data,
      created: (data) => data,
      noAuth: (data) => data,
      conflict: (data) => data,
      unprocessableEntity: (data) => data,
      invalidParameters: (data) => data,
      noAccess: (data) => data,
      noData: (message) {
        if (kDebugMode) {
          print(message);
        }
        BotToast.closeAllLoading();
        return null;
      },
      notFound: (data) => data,
      orElse: () => null,
    );

    return data;
  }


  static Future<Cart> getCart() async {
    final request = NetworkRequest(
      path: APIKeys.cart,
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
          (parser) => Cart.fromJson(parser),
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