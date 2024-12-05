import 'package:get/get.dart';

import '../controllers/support_rquest_details_controller.dart';

class SupportRquestDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportRquestDetailsController>(
      () => SupportRquestDetailsController(),
    );
  }
}
