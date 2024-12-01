import 'package:get/get.dart';
import '../../../data/apis/Resturant_DetailsApis.dart';
import '../../../data/models/Resturant_details.dart';
import '../../../data/models/product_model.dart' as x;

class RestaurantDetailsController extends GetxController {
  var id;
  int selectedIndex = 0;
  late Future<ResturantDetailsModel> getResturantDetails;
  late Future<x.ResturantProductModel> getproduct;
  //List<Class> classes = [];
  List<x.ProductData> filteredProducts = [];
  var allProducts;

  @override
  void onInit() {
    id = Get.arguments?["res_id"];
    getResturantDetails = fetchRestaurantDetails();
    getproduct = fetchRestaurantProducts();
    selectedIndex = -1;
    super.onInit();
  }

  Future<ResturantDetailsModel> fetchRestaurantDetails() async {
    final details = await ResurantDetailsApi.get_Resturant_Details(id);
   // classes = details.data?. ?? [];
    update();
    return details;
  }

  Future<x.ResturantProductModel> fetchRestaurantProducts() async {
    final products = await ResurantDetailsApi.get_Resturant_products(id);
    allProducts = products;
    filteredProducts = products.data!;
    update();
    return products;
  }

  void filterProductsByClass(int index) {
    selectedIndex = index;
    if (selectedIndex == -1 || index == 0) {
      filteredProducts = allProducts.data;
    } else {
    //  final selectedClassId = classes[index - 1].id;
    //  if (selectedClassId != null) {
    //     filteredProducts = allProducts.data
    //         .where((product) => product.category?.id == selectedClassId)
    //         .toList();
    //   }
    }
    print("Filtered Products: ${filteredProducts.length}");
    update();
  }

  void onFilterSelected(int index) {
    filterProductsByClass(index);
    update();
  }
}
