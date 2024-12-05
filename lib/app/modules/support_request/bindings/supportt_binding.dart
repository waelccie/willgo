import 'package:get/get.dart';

import '../controllers/support_Request_controller.dart';

class SupporttBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportRequestController>(
      () => SupportRequestController(),
    );
  }
}
