import 'package:get/get.dart';
import 'package:willgo/app/data/apis/general_apis.dart';
import 'package:willgo/app/data/apis/user_apis.dart';
import 'package:willgo/core/firebase_notifications_handler/firebase_notifications_handler.dart';

import '../../../data/models/user_model.dart';

class NavScreenController extends GetxController {
  int navIndex = 0;
  void changeNavIndex(int index) {
    navIndex = index;
    update();
  }

  @override
  void onReady() async {
    await storeFcmToken();
    super.onReady();
  }

  @override
  void onInit() {
    getUserData = UserApis.getUserData();
    super.onInit();
  }

  late Future<UserModel> getUserData;
  Future<void> storeFcmToken() async {
    String? token = FirebaseNotificationsHandler.fcmToken ?? "FCMTOKEN";
    await GeneralApis.storeFCMToken(fcm: token);
  }
}
 