import 'package:get/get.dart';

import '../controllers/fav_resturant_controller.dart';

class FavResturantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavResturantController>(
      () => FavResturantController(),
    );
  }
}
