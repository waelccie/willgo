import 'package:get/get.dart';

import '../controllers/new_location_controller.dart';

class NewLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewLocationController>(
      () => NewLocationController(),
    );
  }
}
