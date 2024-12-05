import 'package:get/get.dart';

import '../controllers/add_support_request_controller.dart';

class AddSupportRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSupportRequestController>(
      () => AddSupportRequestController(),
    );
  }
}
