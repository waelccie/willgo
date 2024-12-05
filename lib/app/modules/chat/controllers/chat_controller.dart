import 'package:get/get.dart';

class ChatController extends GetxController {
  bool isOnline = false;
  void changeOnlineStatus(bool val) {
    isOnline = val;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
