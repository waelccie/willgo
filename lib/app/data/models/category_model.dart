class CategoryModel {
  CategoryModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final List<Datum> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    required this.icon,
    required this.datumClass,
    required this.productCounts,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final int? status;
  final String? icon;
  final Class? datumClass;
  final int? productCounts;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      nameAr: json["name_ar"],
      nameEn: json["name_en"],
      status: json["status"],
      icon: json["icon"],
      datumClass: json["class"] == null ? null : Class.fromJson(json["class"]),
      productCounts: json["product_counts"],
    );
  }
}

class Class {
  Class({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    required this.icon,
    required this.restaurantCounts,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final int? status;
  final String? icon;
  final int? restaurantCounts;

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json["id"],
      nameAr: json["name_ar"],
      nameEn: json["name_en"],
      status: json["status"],
      icon: json["icon"],
      restaurantCounts: json["restaurant_counts"],
    );
  }
}
