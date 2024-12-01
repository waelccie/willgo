import 'package:get/get.dart';

import '../controllers/nav_screen_controller.dart';

class NavScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavScreenController>(
      () => NavScreenController(),
    );
  }
}
