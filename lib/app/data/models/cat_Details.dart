class categoriesDetails {
  bool? success;
  String? message;
  Null? errors;
  List<Data>? data;

  categoriesDetails({this.success, this.message, this.errors, this.data});

  categoriesDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nameAr;
  String? nameEn;
  int? status;
  String? icon;
  ParentClass? parentClass;
  int? productCounts;

  Data(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.status,
        this.icon,
        this.parentClass,
        this.productCounts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    status = json['status'];
    icon = json['icon'];
    parentClass = json['parent_class'] != null
        ? new ParentClass.fromJson(json['parent_class'])
        : null;
    productCounts = json['product_counts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['status'] = this.status;
    data['icon'] = this.icon;
    if (this.parentClass != null) {
      data['parent_class'] = this.parentClass!.toJson();
    }
    data['product_counts'] = this.productCounts;
    return data;
  }
}

class ParentClass {
  int? id;
  String? nameAr;
  String? nameEn;
  int? status;
  String? icon;
  int? restaurantCounts;

  ParentClass(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.status,
        this.icon,
        this.restaurantCounts});

  ParentClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    status = json['status'];
    icon = json['icon'];
    restaurantCounts = json['restaurant_counts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['status'] = this.status;
    data['icon'] = this.icon;
    data['restaurant_counts'] = this.restaurantCounts;
    return data;
  }
}
