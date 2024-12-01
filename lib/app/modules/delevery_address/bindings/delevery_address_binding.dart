import 'package:get/get.dart';

import '../controllers/delevery_address_controller.dart';

class DeleveryAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleveryAddressController>(
      () => DeleveryAddressController(),
    );
  }
}
