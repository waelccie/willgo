class ProductDetails {
  bool? success;
  String? message;
  List<dynamic>? errors;
  Data? data;

  ProductDetails({this.success, this.message, this.errors, this.data});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    errors = json["errors"] == null ? null : List<dynamic>.from(json["errors"]);
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    if (errors != null) {
      _data["errors"] = errors;
    }
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  dynamic id;
  String? arName;
  String? enName;
  dynamic? price;
  dynamic currentPrice;
  bool? isDiscount;
  dynamic? timeForPreparation;
  Category? category;
  Class? classes;
  List<Options>? options;
  String? description;
  String? nutritionalInformation;
  String? ingredients;
  dynamic? discount;
  dynamic? discountStart;
  dynamic? discountEnd;
  dynamic status;
  dynamic rate;
  List<String>? images;
  String? createdAt;

  Data({
    this.id,
    this.arName,
    this.enName,
    this.price,
    this.currentPrice,
    this.isDiscount,
    this.timeForPreparation,
    this.category,
    this.classes,
    this.options,
    this.description,
    this.nutritionalInformation,
    this.ingredients,
    this.discount,
    this.discountStart,
    this.discountEnd,
    this.status,
    this.rate,
    this.images,
    this.createdAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = _convertToOriginalType(json["id"]);
    arName = json["ar_name"];
    enName = json["en_name"];
    price = json["price"];
    currentPrice = _convertToOriginalType(json["current_price"]);
    isDiscount = json["is_discount"];
    timeForPreparation = json["time_for_preparation"];
    category = json["category"] == null ? null : Category.fromJson(json["category"]);
    classes = json["class"] == null ? null : Class.fromJson(json["class"]);
    options = json["options"] == null
        ? null
        : (json["options"] as List).map((e) => Options.fromJson(e)).toList();
    description = json["description"];
    nutritionalInformation = json["nutritional_information"];
    ingredients = json["ingredients"];
    discount = json["discount"];
    discountStart = json["discount_start"];
    discountEnd = json["discount_end"];
    status = _convertToOriginalType(json["status"]);
    rate = _convertToOriginalType(json["rate"]);
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["ar_name"] = arName;
    _data["en_name"] = enName;
    _data["price"] = price;
    _data["current_price"] = currentPrice;
    _data["is_discount"] = isDiscount;
    _data["time_for_preparation"] = timeForPreparation;
    if (category != null) {
      _data["category"] = category?.toJson();
    }
    if (classes != null) {
      _data["class"] = classes?.toJson();
    }
    if (options != null) {
      _data["options"] = options?.map((e) => e.toJson()).toList();
    }
    _data["description"] = description;
    _data["nutritional_information"] = nutritionalInformation;
    _data["ingredients"] = ingredients;
    _data["discount"] = discount;
    _data["discount_start"] = discountStart;
    _data["discount_end"] = discountEnd;
    _data["status"] = status;
    _data["rate"] = rate;
    if (images != null) {
      _data["images"] = images;
    }
    _data["created_at"] = createdAt;
    return _data;
  }

  dynamic _convertToOriginalType(dynamic value) {
    if (value is int) return value;
    if (value is String) {
      final int? parsed = int.tryParse(value);
      return parsed ?? value; // إذا لم يتم التحويل إلى int، يتم إرجاع النص كما هو
    }
    return value;
  }
}

class Options {
  dynamic id;
  String? title;
  String? price;
  dynamic status;

  Options({this.id, this.title, this.price, this.status});

  Options.fromJson(Map<String, dynamic> json) {
    id = _convertToOriginalType(json["id"]);
    title = json["title"];
    price = json["price"];
    status = _convertToOriginalType(json["status"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["price"] = price;
    _data["status"] = status;
    return _data;
  }

  dynamic _convertToOriginalType(dynamic value) {
    if (value is int) return value;
    if (value is String) {
      final int? parsed = int.tryParse(value);
      return parsed ?? value;
    }
    return value;
  }
}

class Class {
  dynamic id;
  String? nameAr;
  String? nameEn;
  dynamic status;
  String? icon;
  dynamic restaurantCounts;

  Class({this.id, this.nameAr, this.nameEn, this.status, this.icon, this.restaurantCounts});

  Class.fromJson(Map<String, dynamic> json) {
    id = _convertToOriginalType(json["id"]);
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    status = _convertToOriginalType(json["status"]);
    icon = json["icon"];
    restaurantCounts = _convertToOriginalType(json["restaurant_counts"]);
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

  dynamic _convertToOriginalType(dynamic value) {
    if (value is int) return value;
    if (value is String) {
      final int? parsed = int.tryParse(value);
      return parsed ?? value;
    }
    return value;
  }
}

class Category {
  dynamic id;
  String? nameAr;
  String? nameEn;
  dynamic status;
  String? icon;
  ParentClass? parentClass;
  dynamic productCounts;

  Category({this.id, this.nameAr, this.nameEn, this.status, this.icon, this.parentClass, this.productCounts});

  Category.fromJson(Map<String, dynamic> json) {
    id = _convertToOriginalType(json["id"]);
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    status = _convertToOriginalType(json["status"]);
    icon = json["icon"];
    parentClass = json["parent_class"] == null
        ? null
        : ParentClass.fromJson(json["parent_class"]);
    productCounts = _convertToOriginalType(json["product_counts"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_ar"] = nameAr;
    _data["name_en"] = nameEn;
    _data["status"] = status;
    _data["icon"] = icon;
    if (parentClass != null) {
      _data["parent_class"] = parentClass?.toJson();
    }
    _data["product_counts"] = productCounts;
    return _data;
  }

  dynamic _convertToOriginalType(dynamic value) {
    if (value is int) return value;
    if (value is String) {
      final int? parsed = int.tryParse(value);
      return parsed ?? value;
    }
    return value;
  }
}

class ParentClass {
  dynamic id;
  String? nameAr;
  String? nameEn;
  dynamic status;
  String? icon;
  dynamic restaurantCounts;

  ParentClass({this.id, this.nameAr, this.nameEn, this.status, this.icon, this.restaurantCounts});

  ParentClass.fromJson(Map<String, dynamic> json) {
    id = _convertToOriginalType(json["id"]);
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    status = _convertToOriginalType(json["status"]);
    icon = json["icon"];
    restaurantCounts = _convertToOriginalType(json["restaurant_counts"]);
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

  dynamic _convertToOriginalType(dynamic value) {
    if (value is int) return value;
    if (value is String) {
      final int? parsed = int.tryParse(value);
      return parsed ?? value;
    }
    return value;
  }
}
