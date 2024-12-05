class Cart {
  bool? success;
  String? message;
  dynamic errors;
  Data? data;

  Cart({this.success, this.message, this.errors, this.data});

  Cart.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    errors = json["errors"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};
    _data["success"] = success;
    _data["message"] = message;
    _data["errors"] = errors;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<Data1>? data;
  int? totalItems;
  dynamic price; // استخدم dynamic لدعم جميع الأنواع
  dynamic discount; // استخدم dynamic لدعم جميع الأنواع
  dynamic totalPrice; // استخدم dynamic لدعم جميع الأنواع

  Data(
      {this.data, this.totalItems, this.price, this.discount, this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    data = json["data"] != null
        ? (json["data"] as List).map((e) => Data1.fromJson(e)).toList()
        : null;
    totalItems = json["total_items"];
    price = json["price"];
    discount = json["discount"];
    totalPrice = json["total_price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["total_items"] = totalItems;
    _data["price"] = price;
    _data["discount"] = discount;
    _data["total_price"] = totalPrice;
    return _data;
  }
}

class Data1 {
  int? id;
  int? userId;
  Product? product;
  int? quantity;
  List<dynamic>? options;
  dynamic pricePerItem; // استخدم dynamic لدعم جميع الأنواع
  dynamic totalPrice; // استخدم dynamic لدعم جميع الأنواع
  String? createdAt;
  String? updatedAt;

  Data1(
      {this.id,
      this.userId,
      this.product,
      this.quantity,
      this.options,
      this.pricePerItem,
      this.totalPrice,
      this.createdAt,
      this.updatedAt});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    product =
        json["product"] != null ? Product.fromJson(json["product"]) : null;
    quantity = json["quantity"];
    options = json["options"] ?? [];
    pricePerItem = json["price_per_item"];
    totalPrice = json["total_price"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};
    _data["id"] = id;
    _data["user_id"] = userId;
    if (product != null) {
      _data["product"] = product?.toJson();
    }
    _data["quantity"] = quantity;
    _data["options"] = options;
    _data["price_per_item"] = pricePerItem;
    _data["total_price"] = totalPrice;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Product {
  int? id;
  String? arName;
  String? enName;
  dynamic price; // استخدم dynamic لدعم جميع الأنواع
  dynamic currentPrice; // استخدم dynamic لدعم جميع الأنواع
  bool? isDiscount;
  String? timeForPreparation;
  Category? category;
  Class? classes;
  List<Options>? options;
  String? description;
  String? nutritionalInformation;
  String? ingredients;
  dynamic discount; // استخدم dynamic لدعم جميع الأنواع
  String? discountStart;
  String? discountEnd;
  int? status;
  int? rate;
  List<String>? images;
  String? createdAt;

  Product(
      {this.id,
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
      this.createdAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    arName = json["ar_name"];
    enName = json["en_name"];
    price = json["price"];
    currentPrice = json["current_price"];
    isDiscount = json["is_discount"];
    timeForPreparation = json["time_for_preparation"];
    category =
        json["category"] == null ? null : Category.fromJson(json["category"]);
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
    status = json["status"];
    rate = json["rate"];
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
}

class Options {
  int? id;
  String? title;
  String? price;
  int? status;

  Options({this.id, this.title, this.price, this.status});

  Options.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = json["price"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["price"] = price;
    _data["status"] = status;
    return _data;
  }
}

class Class {
  int? id;
  String? nameAr;
  String? nameEn;
  int? status;
  String? icon;
  int? restaurantCounts;

  Class(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.status,
      this.icon,
      this.restaurantCounts});

  Class.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    status = json["status"];
    icon = json["icon"];
    restaurantCounts = json["restaurant_counts"];
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
}

class Category {
  int? id;
  String? nameAr;
  String? nameEn;
  int? status;
  String? icon;
  ParentClass? parentClass;
  int? productCounts;

  Category(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.status,
      this.icon,
      this.parentClass,
      this.productCounts});

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    status = json["status"];
    icon = json["icon"];
    parentClass = json["parent_class"] == null
        ? null
        : ParentClass.fromJson(json["parent_class"]);
    productCounts = json["product_counts"];
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
    id = json["id"];
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    status = json["status"];
    icon = json["icon"];
    restaurantCounts = json["restaurant_counts"];
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
}
