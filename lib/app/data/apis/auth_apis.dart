import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:willgo/app/data/models/main_model.dart';
import 'package:willgo/app/data/models/register_model.dart';
import 'package:willgo/app/data/models/send_otp_model.dart';
import 'package:willgo/app/data/models/verify_otp_model.dart';
import 'package:willgo/app/data/parameters/auth/register_parameters.dart';
import 'package:willgo/app/data/parameters/auth/reset_password_parameters.dart';
import 'package:willgo/app/data/parameters/auth/verify_otp_parameters.dart';
import '../../../core/global/const.dart';
import '../../../core/services/get_storage_helper.dart';
import '../../../core/services/network_service.dart/dio_network_service.dart';
import '../models/login_model.dart';
import '../models/sendReset.dart';
import '../models/update_profile.dart';
import '../parameters/auth/login_parameters.dart';
import '../parameters/auth/sendVerifyOtp.dart';
import '../parameters/auth/send_otp_pararmeters.dart';
import '../parameters/auth/uppdateLatLng.dart';
import '../parameters/updateUser.dart';

class AuthApis {
  static Future<LoginModel> login({
    required LoginParameters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.login,
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
      (parser) => LoginModel.fromJson(parser),
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

  static Future<RegisterModel> register({
    required RegisterParameters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.register,
      type: NetworkRequestType.POST,
      headers: {},
      data: NetworkRequestBody.fromData(
        FormData.fromMap(parameters.toMap()),
      ),
    );
    final response = await networkService.execute(
      request,
      (parser) => RegisterModel.fromJson(parser),
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
      unprocessableEntity: (data) {
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

  static Future<RegisterAfteOtp> RegisterAfterOtp({
    required VerifyOtpParameters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.registerAfterOtp,
      type: NetworkRequestType.POST,
      headers: {
        // if (CacheHelper.getUserToken != null)
        //   'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        // "lang": CacheHelper.getLocale,
      },
      data: NetworkRequestBody.fromData(
        FormData.fromMap(parameters.toMap()),
      ),
    );
    final response = await networkService.execute(
      request,
      (parser) => RegisterAfteOtp.fromJson(parser),
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
      unprocessableEntity: (data) {
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

  static Future<SendOtpModel> sendOtp({
    required SendOtpPararmeters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.sendOtp,
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
      (parser) => SendOtpModel.fromJson(parser),
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

  static Future<SendRestPasswordOtp> sendRsesetPassword({
    required SendOtpPassPararmeters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.resetOtpPassword,
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
      (parser) => SendRestPasswordOtp.fromJson(parser),
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

  static Future<MainModel> resetPassword({
    required ResetPasswordParameters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.verifyPhone,
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

  static Future<MainModel> vrifyOtpresetPassword({
    required OtpParameters parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.vtifyOtp,
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

  // static Future<MainModel> deleteAccount({
  //   required ResetPasswordParameters parameters,
  // }) async {
  //   final request = NetworkRequest(
  //     path: APIKeys.deleteAccount,
  //     type: NetworkRequestType.POST,
  //     headers: {
  //       if (CacheHelper.getUserToken != null)
  //         'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
  //       "lang": CacheHelper.getLocale,
  //     },
  //     data: NetworkRequestBody.fromData(
  //       FormData.fromMap(parameters.toMap()),
  //     ),
  //   );
  //   final response = await networkService.execute(
  //     request,
  //         (parser) => MainModel.fromJson(parser),
  //   );
  //   var data = response.maybeWhen(
  //     ok: ((data) {
  //       return data;
  //     }),
  //     orElse: () {
  //       return null;
  //     },
  //     badRequest: (data) {
  //       return data;
  //     },
  //     created: (data) {
  //       return data;
  //     },
  //     unprocessableEntity: (data) {
  //       return data;
  //     },
  //     noAuth: (data) {
  //       return data;
  //     },
  //     conflict: (data) {
  //       return data;
  //     },
  //     invalidParameters: (data) {
  //       return data;
  //     },
  //     noAccess: (data) {
  //       return data;
  //     },
  //     noData: (message) {
  //       if (kDebugMode) {
  //         print(message);
  //       }
  //       BotToast.closeAllLoading();
  //     },
  //     notFound: (data) {
  //       return data;
  //     },
  //   );
  //   return data;
  // }

  static Future<MainModel> logout() async {
    final request = NetworkRequest(
      path: APIKeys.logout,
      type: NetworkRequestType.POST,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,
      },
      data: const NetworkRequestBody.empty(),
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

  static Future<MainModel> deleteAccount() async {
    final request = NetworkRequest(
      path: APIKeys.deleteAccount,
      type: NetworkRequestType.DELETE,
      headers: {
        if (CacheHelper.getUserToken != null)
          'Authorization': "Bearer ${CacheHelper.getUserToken ?? ""}",
        "lang": CacheHelper.getLocale,
      },
      data: const NetworkRequestBody.empty(),
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

  static Future<UpdateProfie> updateProfile({
    required UserUpdate parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.updateUser,
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
      (parser) => UpdateProfie.fromJson(parser),
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

  static Future<UpdateProfie> updateLatLngProfile({
    required LatLng parameters,
  }) async {
    final request = NetworkRequest(
      path: APIKeys.updateUser,
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
      (parser) => UpdateProfie.fromJson(parser),
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
