import 'package:get/get.dart';
import '../../app/modules/environment/controllers/environment_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<EnvironmentController>(EnvironmentController());
  }
}
