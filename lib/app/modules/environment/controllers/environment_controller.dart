import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:latlong2/latlong.dart'as x;

import '../../../../core/global/const.dart';
import '../../../../core/services/get_storage_helper.dart';
import '../../../data/apis/auth_apis.dart';
import '../../../data/parameters/auth/uppdateLatLng.dart';

class EnvironmentController extends GetxController {
  final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker();
  bool connected = true;
  @override
  void onInit() {
    locale = Locale(CacheHelper.getLocale);
    debugPrint("locale $locale");
    update();
    Get.updateLocale(locale!);
    _internetConnectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        connected = true;
      } else {
        connected = false;
      }
      update();
      debugPrint("InternetCheckerService $status");
    });

    super.onInit();
  }

  Future<void> checkConnection() async {
    final isConnected = await _internetConnectionChecker.hasConnection;
    if (isConnected) {
      connected = true;
    } else {
      connected = false;
    }
    update();
    debugPrint("InternetCheckerService $isConnected");
  }

  Locale? locale;
  void setLocale(Locale newLocale) async {
    await CacheHelper.cacheLocale(langCode: newLocale.languageCode);
    locale = newLocale;
    Get.updateLocale(locale!);
    update();
  }

  x.LatLng? latLng;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.high,
    );
    latLng = x.LatLng(position.latitude, position.longitude);

    update();
    await updateLatLngprofile(position.latitude,position.longitude);

    print(latLng!.latitude);
    update();
  }



  Future<void>updateLatLngprofile(latitude,longitude)async {
print("ssssssssssssssssssssssssssssssssssssss$latitude");
    var res = await AuthApis.updateLatLngProfile(
        parameters:LatLng(latitude: latitude, longitude: longitude)
    );
    if (res.success == true) {
      BotToast.closeAllLoading();
      BotToast.showText(text: res.message ?? "");

    } else {
      showErrorsSequentially(res.errors ?? []);

      print(res.errors);

      BotToast.closeAllLoading();
    }
  }



}
