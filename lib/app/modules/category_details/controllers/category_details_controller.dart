import 'package:get/get.dart';
import 'package:willgo/app/data/apis/home_apis.dart';

import '../../../data/models/ResturantByCat.dart';
import '../../../data/models/cat_Details.dart';

class CategoryDetailsController extends GetxController {
  int? parentCategoryId;
  String? parentCategoryName;
  late Future<categoriesDetails> getCateogriesDetails;

  Future<void> fetchCateogriesDetails(id) async {
    getCateogriesDetails =  HomeApis.getCategoryDetails(id);
    update();
  }

bool isClicked=false;
  late Future<ResturantByCat>getResurantByCat;

  Future<void> fetchResturantByCat(catid,classid) async {
     getResurantByCat =  HomeApis.getResturantByCat(catid,classid);
    update();
  }




}
