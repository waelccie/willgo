import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:willgo/app/data/parameters/location/new_location.dart';

import '../../../core/global/const.dart';
import '../../../core/services/get_storage_helper.dart';
import '../../../core/services/network_service.dart/dio_network_service.dart';
import '../models/getLocation.dart';
import '../models/locationById.dart';
import '../models/newLocation_model.dart';
import '../models/setPrimaryLocation.dart';

class NewLocationApis {
  static Future<NewLocationModel> addNewLocation({
    required NewLoaction parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.addLocation, // Update this path to your cart endpoint
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
      (parser) => NewLocationModel.fromJson(parser),
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

  static Future<SetPrimaryLocatiom> getDefaultLocation() async {
    final request = NetworkRequest(
      path: APIKeys.getDEfaultLocation,
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
      (parser) => SetPrimaryLocatiom.fromJson(parser),
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

  static Future<GetLocation> getLocation() async {
    final request = NetworkRequest(
      path: APIKeys.getAllLocation,
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
      (parser) => GetLocation.fromJson(parser),
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

  static Future<LocarionById> getAllLocationbyId(id) async {
    final request = NetworkRequest(
      path: APIKeys.getLocationByid(id),
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
      (parser) => LocarionById.fromJson(parser),
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

  static Future<SetPrimaryLocatiom> setDefaultLocation({id}) async {
    final request = NetworkRequest(
      path: APIKeys.setDefaultLocation(
          id), // Update this path to your cart endpoint
      type: NetworkRequestType.POST,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,
      },
      data: NetworkRequestBody.fromData(
        FormData.fromMap({}),
      ),
    );

    final response = await networkService.execute(
      request,
      (parser) => SetPrimaryLocatiom.fromJson(parser),
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
}
