class Cart {
  Cart({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final Data? data;

  factory Cart.fromJson(Map<String, dynamic> json){
    return Cart(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.data,
    required this.totalItems,
    required this.deliveryFee,
    required this.price,
    required this.discount,
    required this.totalPrice,
  });

  final List<Datum> data;
  final dynamic? totalItems;
  final String? deliveryFee;
  final String? price;
  final String? discount;
  final String? totalPrice;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      totalItems: json["total_items"],
      deliveryFee: json["delivery_fee"],
      price: json["price"],
      discount: json["discount"],
      totalPrice: json["total_price"],
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.product,
    required this.notes,
    required this.quantity,
    required this.options,
    required this.pricePerItem,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? userId;
  final Product? product;
  final dynamic notes;
  final dynamic? quantity;
  final List<dynamic> options;
  final dynamic? pricePerItem;
  final dynamic? totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      userId: json["user_id"],
      product: json["product"] == null ? null : Product.fromJson(json["product"]),
      notes: json["notes"],
      quantity: json["quantity"],
      options: json["options"] == null ? [] : List<dynamic>.from(json["options"]!.map((x) => x)),
      pricePerItem: json["price_per_item"],
      totalPrice: json["total_price"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class Product {
  Product({
    required this.id,
    required this.arName,
    required this.enName,
    required this.price,
    required this.currentPrice,
    required this.isDiscount,
    required this.timeForPreparation,
    required this.category,
    required this.productClass,
    required this.options,
    required this.description,
    required this.nutritionalInformation,
    required this.ingredients,
    required this.discount,
    required this.discountStart,
    required this.discountEnd,
    required this.status,
    required this.rate,
    required this.images,
    required this.createdAt,
  });

  final int? id;
  final String? arName;
  final String? enName;
  final dynamic? price;
  final dynamic? currentPrice;
  final bool? isDiscount;
  final String? timeForPreparation;
  final Category? category;
  final Class? productClass;
  final List<Option> options;
  final String? description;
  final String? nutritionalInformation;
  final String? ingredients;
  final dynamic? discount;
  final DateTime? discountStart;
  final DateTime? discountEnd;
  final dynamic? status;
  final dynamic? rate;
  final List<String> images;
  final DateTime? createdAt;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"],
      arName: json["ar_name"],
      enName: json["en_name"],
      price: json["price"],
      currentPrice: json["current_price"],
      isDiscount: json["is_discount"],
      timeForPreparation: json["time_for_preparation"],
      category: json["category"] == null ? null : Category.fromJson(json["category"]),
      productClass: json["class"] == null ? null : Class.fromJson(json["class"]),
      options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
      description: json["description"],
      nutritionalInformation: json["nutritional_information"],
      ingredients: json["ingredients"],
      discount: json["discount"],
      discountStart: DateTime.tryParse(json["discount_start"] ?? ""),
      discountEnd: DateTime.tryParse(json["discount_end"] ?? ""),
      status: json["status"],
      rate: json["rate"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

}

class Category {
  Category({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    required this.icon,
    required this.parentClass,
    required this.productCounts,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final int? status;
  final String? icon;
  final Class? parentClass;
  final int? productCounts;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["id"],
      nameAr: json["name_ar"],
      nameEn: json["name_en"],
      status: json["status"],
      icon: json["icon"],
      parentClass: json["parent_class"] == null ? null : Class.fromJson(json["parent_class"]),
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

  factory Class.fromJson(Map<String, dynamic> json){
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

class Option {
  Option({
    required this.id,
    required this.title,
    required this.price,
    required this.status,
  });

  final int? id;
  final String? title;
  final String? price;
  final int? status;

  factory Option.fromJson(Map<String, dynamic> json){
    return Option(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      status: json["status"],
    );
  }

}
