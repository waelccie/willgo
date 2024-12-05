import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:willgo/app/modules/update_currunt_address/controllers/update_currunt_address_controller.dart';

import '../../../../core/global/const.dart';
import '../../../data/apis/location_apis.dart';
import '../../../data/models/getLocation.dart';
import '../../../data/parameters/location/new_location.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/loading_widget.dart';
import '../../check_out/controllers/check_out_controller.dart';

class NewLocationController extends GetxController {
  //TODO: Implement NewLocationController

  final count = 0.obs;

  var buildingName = TextEditingController();
  var appartNum = TextEditingController();
  var floor = TextEditingController();
  var streetController = TextEditingController();
  var additionalData = TextEditingController();
  var phone = TextEditingController();

  void increment() => count.value++;
  LocationPermission? permission;
  Position? position;

  String? street;
  String? cityAndCountry;
  bool isLocation = false;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getLocationAndAddress() async {
    try {
      position = await _getCurrentLocation();
      print(
          "Location: Lat: ${position!.latitude}, Long: ${position!.longitude}");

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position!.latitude,
        position!.longitude,
      );
      update();

      Placemark place = placemarks[0];

      street = place.street;
      cityAndCountry = "${place.locality}, ${place.country}";
      update();
      isLocation = true;
      print("Street: $street");
      print("City and Country: $cityAndCountry");
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> add_newLocation() async {
    try {
      showLoading();
      var res = await NewLocationApis.addNewLocation(
        parameters: NewLoaction(
          name: cityAndCountry?.toString() ?? '',
          address: cityAndCountry?.toString() ?? '',
          latitude: position?.latitude.toString() ?? '',
          longitude: position?.longitude.toString() ?? '',
          phoneNumber: phone.text.trim(),
          buildingName: buildingName.text.trim(),
          streetName: streetController.text.trim(),
          additionalDetails: additionalData.text.trim(),
          apartmentName: appartNum.text.trim(),
        ),
      );

      // Detailed null and success checking
      if (res == null) {
        BotToast.showText(text: "No response received");
        return;
      }

      if (res.success != true) {
        showErrorsSequentially(res.errors ?? []);
        BotToast.showText(text: res.message ?? "Failed to add location");
        return;
      }

      // Extensive null checking for data and id
      if (res.data == null) {
        BotToast.showText(text: "No location data returned");
        return;
      }

      final locationId = res.data!.id;
      if (locationId == null) {
        BotToast.showText(text: "Location ID is missing");
        return;
      }

      // Safely set default location
      await Get.find<UpdateCurruntAddressController>()
          .setDefaultLocation(locationId);

      BotToast.showText(text: res.message ?? "Location added successfully");

      // Navigation logic
      if (Get.find<CheckOutController>().isCheck == true) {
        Get.offAllNamed(
          Routes.CHECK_OUT,
          arguments: {"refresh": true},
        );
        Get.find<CheckOutController>().isCheck = false;
      } else {
        Get.offAllNamed(
          Routes.UPDATE_CURRUNT_ADDRESS,
          arguments: {"refresh": true},
        );
      }
    } catch (e) {
      print("Error adding new location: $e");
      BotToast.showText(text: "An unexpected error occurred");
    } finally {
      BotToast.closeAllLoading();
    }
  }
}
