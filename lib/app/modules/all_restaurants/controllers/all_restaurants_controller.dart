import 'package:get/get.dart';

import '../../../data/apis/home_apis.dart';
import '../../../data/models/restaurants_model.dart';
import '../../../data/parameters/home/get_restaurants_parameters.dart';

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
        longitude: 31.1669351,
        latitude: 30.9553698, page: 0,
      ),
    );
    update();
    print("jjjjjjjjjjj");
  }

}
