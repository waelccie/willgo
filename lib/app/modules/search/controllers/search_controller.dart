import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/global/const.dart';
import '../../../data/apis/SearchApis.dart';
import '../../../data/models/searchModel.dart';
import '../../../data/parameters/search/searchApis.dart';
import '../../../widgets/loading_widget.dart';

class SearchControllers extends GetxController {
  // حقل النص المستخدم في واجهة البحث
  var search_Controller = TextEditingController();

  // نموذج البحث الذي يحتوي على البيانات المسترجعة
  late SearchModel? searchModel;

  // قائمة المنتجات المسترجعة
  List<Product> productResults = [];

  // قائمة المطاعم المسترجعة
  List<Restaurant> restaurantResults = [];

  // حالة التحميل
  bool isLoading = false;

  /// استدعاء API لتنفيذ البحث بناءً على النص المدخل
  Future<void> searchCall(String query) async {
    if (query.isEmpty) {
      productResults.clear(); // مسح نتائج المنتجات عند إدخال نص فارغ
      restaurantResults.clear(); // مسح نتائج المطاعم عند إدخال نص فارغ
      update();
      return;
    }

    isLoading = true;
    update();

    try {
      showLoading(); // عرض مؤشر تحميل

      // استدعاء API الخاص بالبحث
      var res = await searchApis.search(
        parameters: searcParaneter(name: query),
      );

      if (res.success == true) {
        // تحديث البيانات عند نجاح الاستدعاء
        searchModel = res;

        // تقسيم النتائج إلى منتجات ومطاعم
        productResults = searchModel?.data?.products ?? [];
        restaurantResults = searchModel?.data?.restaurants ?? [];

        BotToast.closeAllLoading();
        BotToast.showText(text: res.message ?? "Search successful");
      } else {
        // عرض الأخطاء إذا حدثت مشكلة
        showErrorsSequentially(res.errors ?? []);
        productResults.clear();
        restaurantResults.clear();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch search results");
    } finally {
      isLoading = false;
      BotToast.closeAllLoading();
      update(); // تحديث واجهة المستخدم
    }
  }
}
