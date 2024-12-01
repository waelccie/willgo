import 'package:get/get.dart';

import '../../../../core/enums/enums.dart';

class SuccessController extends GetxController {
  SuccessType? successType;

  @override
  void onInit() {
    successType = Get.arguments?["successType"];
    super.onInit();
  }
}
