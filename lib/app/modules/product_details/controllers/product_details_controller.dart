import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:willgo/app/data/apis/Product_DetailsApi.dart';
import '../../../../core/global/const.dart';
import '../../../data/apis/auth_apis.dart';
import '../../../data/models/product_details.dart' as x;
import '../../../data/parameters/cart/add to cart.dart';
import '../../../widgets/loading_widget.dart';

class ProductDetailsController extends GetxController {
  // Product ID from arguments
  var id;

  // Product details future
  late Future<x.ProductDetails> getproductDetail;

  // Quantity management
  int quantity = 1;

  // Selected options list
  RxList<x.Options> selectedOptions = <x.Options>[].obs;

  @override
  void onInit() {
    id = Get.arguments?["product_id"];
    getproductDetail = ProductDetailsApi.getProductsDetails(id);
    super.onInit();
  }

  // Increase quantity
  void increaseQuantity() {
    quantity++;
    update();
  }

  // Decrease quantity (minimum 1)
  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
      update();
    }
  }

  // Add option to selected options
  void addOption(x.Options option) {
    if (!selectedOptions.contains(option)) {
      selectedOptions.add(option);
    }
    update();
  }

  // Remove option from selected options
  void removeOption(x.Options option) {
    selectedOptions.remove(option);
    update();
  }

  // Add to cart method with selected options
  Future<void> addToCart(int productId) async {
    try {
      showLoading();

      // Convert selected options to Option objects
      List<Option> cartOptions =
          selectedOptions.map((option) => Option(id: option.id ?? 0)).toList();

      var res = await ProductDetailsApi.addToCart(
        parameters: CartParameters(products: [
          Product(
              productId: productId, quantity: quantity, options: cartOptions)
        ]),
      );

      if (res.success == true) {
        BotToast.closeAllLoading();
        BotToast.showText(text: res.message ?? "Added to cart successfully");
      } else {
        showErrorsSequentially(res.errors ?? []);
        BotToast.closeAllLoading();
      }
    } catch (e) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Error adding to cart");
      print("Error in addToCart: $e");
    }
  }
}
