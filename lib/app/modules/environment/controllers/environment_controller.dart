import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/services/get_storage_helper.dart';

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

  LatLng? latLng;

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
    latLng = LatLng(position.latitude, position.longitude);
    update();
  }
}
