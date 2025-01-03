import 'package:get/get.dart';

import '../../../data/apis/home_apis.dart';
import '../../../data/models/restaurants_model.dart';
import '../../../data/parameters/home/get_restaurants_parameters.dart';
import '../../environment/controllers/environment_controller.dart';

class AllRestaurantsController extends GetxController {
  int selectedIndex = 0;

  final List<String> filters = ["free delivery", "rate +4.5", "popular"];
  void onFilterSelected(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    getAllResturant();
    super.onInit();
  }

  RestaurantsModel? getAllResturantController;

  Future getAllResturant() async {
    getAllResturantController = await HomeApis.getAllResturant(
      GetRestaurantsParameters(
        longitude:  Get.find<EnvironmentController>().latLng!.longitude,
        latitude:  Get.find<EnvironmentController>().latLng!.latitude,
        page: 0,
      ),
    );
    update();
    print("jjjjjjjjjjj");
  }
}
