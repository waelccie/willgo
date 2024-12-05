import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:willgo/app/data/apis/home_apis.dart';
import 'package:willgo/app/data/models/restaurants_model.dart';
import 'package:willgo/app/modules/environment/controllers/environment_controller.dart';
import '../../../../core/global/const.dart';
import '../../../data/apis/location_apis.dart';
import '../../../data/models/parent_categories_model.dart';
import '../../../data/models/setPrimaryLocation.dart';
import '../../../data/models/sliders_model.dart';
import '../../../data/parameters/home/get_restaurants_parameters.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getAllSliders = HomeApis.getAllSliders();
    getLocation = NewLocationApis.getDefaultLocation();
    getCityName();
    super.onInit();
  }

  late Future<SetPrimaryLocatiom> getLocation;
  late Future<SlidersModel> getAllSliders;

  int adsIndex = 0;
  onChangeAdsIndex(int val) {
    adsIndex = val;
    update();
  }

  late final getAllParentCategoriesPagingController =
      PagingController<int, ParentCategory>(firstPageKey: 0)
        ..addPageRequestListener(_getAllParentCategories);

  Future _getAllParentCategories(int firstPageKey) async {
    ParentCategoriesModel res =
        await HomeApis.getAllParentCategories(firstPageKey);
    if (res.success == true) {
      final newItems = res.data?.where((e) {
        return !(getAllParentCategoriesPagingController.itemList?.contains(e) ??
            false);
      }).toList();
      final isLastPage = (res.data?.length ?? 0) < pageLimit;
      if (isLastPage) {
        getAllParentCategoriesPagingController.appendLastPage(newItems ?? []);
      } else {
        getAllParentCategoriesPagingController.appendPage(
          newItems ?? [],
          firstPageKey + 1,
        );
      }
      update();
    }
  }

  late final getAllPopularResturantPagingController =
      PagingController<int, Restaurant>(firstPageKey: 0)
        ..addPageRequestListener(_getAllPopularResturant);

  Future _getAllPopularResturant(int firstPageKey) async {
    Get.put(EnvironmentController());
    RestaurantsModel res = await HomeApis.getAllResturant(
      GetRestaurantsParameters(
        longitude: Get.find<EnvironmentController>().latLng!.longitude,
        latitude: Get.find<EnvironmentController>().latLng!.latitude,
        page: firstPageKey,
      ),
    );
    if (res.success == true) {
      final newItems = res.data?.where((e) {
        return !(getAllPopularResturantPagingController.itemList?.contains(e) ??
            false);
      }).toList();
      final isLastPage = (res.data?.length ?? 0) < pageLimit;
      if (isLastPage) {
        getAllPopularResturantPagingController.appendLastPage(newItems ?? []);
      } else {
        getAllPopularResturantPagingController.appendPage(
          newItems ?? [],
          firstPageKey + 1,
        );
      }
      update();
    }
  }

  String currentCity = "";

  Future<void> getCityName() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentCity = place.locality ??
            place.subAdministrativeArea ??
            place.administrativeArea ??
            "Un Known";
        update();
        print('Current City: $currentCity');
      }
    } catch (e) {
      print('Error getting city name: $e');
      currentCity = "Error getting city name";
      update();
    }
  }
}
