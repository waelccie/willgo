import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'app/modules/environment/controllers/environment_controller.dart';
import 'core/firebase_notifications_handler/src/widget.dart';
import 'core/services/get_storage_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  log(CacheHelper.getUserToken.toString());
  Get.put<EnvironmentController>(EnvironmentController());
  Get.find<EnvironmentController>().checkConnection();
  Get.find<EnvironmentController>().getCurrentLocation();


  runApp(const FirebaseNotificationsHandler(child: MyApp()));
}