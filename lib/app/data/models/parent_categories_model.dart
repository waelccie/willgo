class ParentCategoriesModel {
  bool? success;
  String? message;
  List<String>? errors;
  List<ParentCategory>? data;

  ParentCategoriesModel({this.success, this.message, this.errors, this.data});

  ParentCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["errors"] is List) {
      errors =
          json["errors"] == null ? null : List<String>.from(json["errors"]);
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => ParentCategory.fromJson(e))
              .toList();
    }
  }

  static List<ParentCategoriesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ParentCategoriesModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    if (errors != null) {
      _data["errors"] = errors;
    }
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  ParentCategoriesModel copyWith({
    bool? success,
    String? message,
    List<String>? errors,
    List<ParentCategory>? data,
  }) =>
      ParentCategoriesModel(
        success: success ?? this.success,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        data: data ?? this.data,
      );
}

class ParentCategory {
  int? id;
  String? nameAr;
  String? nameEn;
  int? status;
  String? icon;
  int? restaurantCounts;

  ParentCategory(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.status,
      this.icon,
      this.restaurantCounts});

  ParentCategory.fromJson(Map<String, dynamic> json) {
    if (json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if (json["name_ar"] is String) {
      nameAr = json["name_ar"];
    }
    if (json["name_en"] is String) {
      nameEn = json["name_en"];
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["icon"] is String) {
      icon = json["icon"];
    }
    if (json["restaurant_counts"] is num) {
      restaurantCounts = (json["restaurant_counts"] as num).toInt();
    }
  }

  static List<ParentCategory> fromList(List<Map<String, dynamic>> list) {
    return list.map(ParentCategory.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_ar"] = nameAr;
    _data["name_en"] = nameEn;
    _data["status"] = status;
    _data["icon"] = icon;
    _data["restaurant_counts"] = restaurantCounts;
    return _data;
  }

  ParentCategory copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    int? status,
    String? icon,
    int? restaurantCounts,
  }) =>
      ParentCategory(
        id: id ?? this.id,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        status: status ?? this.status,
        icon: icon ?? this.icon,
        restaurantCounts: restaurantCounts ?? this.restaurantCounts,
      );
}
