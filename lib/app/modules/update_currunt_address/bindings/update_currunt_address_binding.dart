import 'package:get/get.dart';

import '../controllers/update_currunt_address_controller.dart';

class UpdateCurruntAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateCurruntAddressController>(
      () => UpdateCurruntAddressController(),
    );
  }
}
