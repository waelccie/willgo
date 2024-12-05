class ResturantProductModel {
  bool? success;
  String? message;
  dynamic errors;
  List<ProductData>? data;

  ResturantProductModel({
    this.success,
    this.message,
    this.errors,
    this.data,
  });

  factory ResturantProductModel.fromJson(Map<String, dynamic> json) =>
      ResturantProductModel(
        success: json["success"],
        message: json["message"]?.toString(),
        errors: json["errors"],
        data: json["data"] == null
            ? []
            : List<ProductData>.from(
                json["data"]!.map((x) => ProductData.fromJson(x))),
      );
}

class ProductData {
  String? id;
  String? arName;
  String? enName;
  String? price;
  String? currentPrice;
  bool? isDiscount;
  String? timeForPreparation;
  Category? category;
  Class? productClass;
  List<Option>? options;
  String? description;
  String? nutritionalInformation;
  String? ingredients;
  dynamic discount;
  dynamic discountStart;
  dynamic discountEnd;
  String? status;
  String? rate;
  List<String>? images;
  String? createdAt;

  ProductData({
    this.id,
    this.arName,
    this.enName,
    this.price,
    this.currentPrice,
    this.isDiscount,
    this.timeForPreparation,
    this.category,
    this.productClass,
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

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"]?.toString(),
        arName: json["ar_name"]?.toString(),
        enName: json["en_name"]?.toString(),
        price: json["price"]?.toString(),
        currentPrice: json["current_price"]?.toString(),
        isDiscount: json["is_discount"],
        timeForPreparation: json["time_for_preparation"]?.toString(),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        productClass:
            json["class"] == null ? null : Class.fromJson(json["class"]),
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
        description: json["description"]?.toString(),
        nutritionalInformation: json["nutritional_information"]?.toString(),
        ingredients: json["ingredients"]?.toString(),
        discount: json["discount"],
        discountStart: json["discount_start"],
        discountEnd: json["discount_end"],
        status: json["status"]?.toString(),
        rate: json["rate"]?.toString(),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x.toString())),
        createdAt: json["created_at"]?.toString(),
      );
}

class Category {
  String? id;
  String? nameAr;
  String? nameEn;
  String? status;
  String? icon;
  ParentClass? parentClass;
  String? productCounts;

  Category({
    this.id,
    this.nameAr,
    this.nameEn,
    this.status,
    this.icon,
    this.parentClass,
    this.productCounts,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"]?.toString(),
        nameAr: json["name_ar"]?.toString(),
        nameEn: json["name_en"]?.toString(),
        status: json["status"]?.toString(),
        icon: json["icon"]?.toString(),
        parentClass: json["parent_class"] == null
            ? null
            : ParentClass.fromJson(json["parent_class"]),
        productCounts: json["product_counts"]?.toString(),
      );
}

class ParentClass {
  String? id;
  String? nameAr;
  String? nameEn;
  String? status;
  String? icon;
  String? restaurantCounts;

  ParentClass({
    this.id,
    this.nameAr,
    this.nameEn,
    this.status,
    this.icon,
    this.restaurantCounts,
  });

  factory ParentClass.fromJson(Map<String, dynamic> json) => ParentClass(
        id: json["id"]?.toString(),
        nameAr: json["name_ar"]?.toString(),
        nameEn: json["name_en"]?.toString(),
        status: json["status"]?.toString(),
        icon: json["icon"]?.toString(),
        restaurantCounts: json["restaurant_counts"]?.toString(),
      );
}

class Class {
  String? id;
  String? nameAr;
  String? nameEn;
  String? status;
  String? icon;
  String? restaurantCounts;

  Class({
    this.id,
    this.nameAr,
    this.nameEn,
    this.status,
    this.icon,
    this.restaurantCounts,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"]?.toString(),
        nameAr: json["name_ar"]?.toString(),
        nameEn: json["name_en"]?.toString(),
        status: json["status"]?.toString(),
        icon: json["icon"]?.toString(),
        restaurantCounts: json["restaurant_counts"]?.toString(),
      );
}

class Option {
  String? id;
  String? title;
  String? price;
  String? status;

  Option({
    this.id,
    this.title,
    this.price,
    this.status,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"]?.toString(),
        title: json["title"]?.toString(),
        price: json["price"]?.toString(),
        status: json["status"]?.toString(),
      );
}
