class SearchModel {
  SearchModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final Data? data;

  factory SearchModel.fromJson(Map<String, dynamic> json){
    return SearchModel(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  @override
  String toString(){
    return "$success, $message, $errors, $data, ";
  }
}

class Data {
  Data({
    required this.restaurants,
    required this.products,
  });

  final List<Restaurant> restaurants;
  final List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      restaurants: json["restaurants"] == null ? [] : List<Restaurant>.from(json["restaurants"]!.map((x) => Restaurant.fromJson(x))),
      products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    );
  }

  @override
  String toString(){
    return "$restaurants, $products, ";
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
  final String? price;
  final String? currentPrice;
  final bool? isDiscount;
  final String? timeForPreparation;
  final Category? category;
  final Class? productClass;
  final List<Option> options;
  final String? description;
  final String? nutritionalInformation;
  final String? ingredients;
  final int? discount;
  final dynamic discountStart;
  final dynamic discountEnd;
  final int? status;
  final int? rate;
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
      discountStart: json["discount_start"],
      discountEnd: json["discount_end"],
      status: json["status"],
      rate: json["rate"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  @override
  String toString(){
    return "$id, $arName, $enName, $price, $currentPrice, $isDiscount, $timeForPreparation, $category, $productClass, $options, $description, $nutritionalInformation, $ingredients, $discount, $discountStart, $discountEnd, $status, $rate, $images, $createdAt, ";
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

  @override
  String toString(){
    return "$id, $nameAr, $nameEn, $status, $icon, $parentClass, $productCounts, ";
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

  @override
  String toString(){
    return "$id, $nameAr, $nameEn, $status, $icon, $restaurantCounts, ";
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

  @override
  String toString(){
    return "$id, $title, $price, $status, ";
  }
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.arName,
    required this.enName,
    required this.email,
    required this.phone,
    required this.photo,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.rate,
    required this.phoneNumbers,
    required this.deliveryTime,
    required this.crNumber,
    required this.taxId,
    required this.licenceExpireDate,
    required this.legalEntityName,
    required this.status,
    required this.isFavourite,
    required this.orderCounts,
    required this.createdAt,
    required this.totalOrderNotPaid,
    required this.totalOrderMoneyNotPaid,
    required this.deliveryFees,
    required this.totalOrderMoneyDiscount,
    required this.totalOrderRestaurantMoneyNotPaid,
  });

  final int? id;
  final String? arName;
  final String? enName;
  final String? email;
  final String? phone;
  final String? photo;
  final String? address;
  final String? latitude;
  final String? longitude;
  final int? rate;
  final dynamic phoneNumbers;
  final String? deliveryTime;
  final String? crNumber;
  final String? taxId;
  final dynamic licenceExpireDate;
  final dynamic legalEntityName;
  final int? status;
  final bool? isFavourite;
  final int? orderCounts;
  final DateTime? createdAt;
  final int? totalOrderNotPaid;
  final int? totalOrderMoneyNotPaid;
  final int? deliveryFees;
  final int? totalOrderMoneyDiscount;
  final int? totalOrderRestaurantMoneyNotPaid;

  factory Restaurant.fromJson(Map<String, dynamic> json){
    return Restaurant(
      id: json["id"],
      arName: json["ar_name"],
      enName: json["en_name"],
      email: json["email"],
      phone: json["phone"],
      photo: json["photo"],
      address: json["address"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      rate: json["rate"],
      phoneNumbers: json["phone_numbers"],
      deliveryTime: json["delivery_time"],
      crNumber: json["cr_number"],
      taxId: json["tax_id"],
      licenceExpireDate: json["licence_expire_date"],
      legalEntityName: json["legal_entity_name"],
      status: json["status"],
      isFavourite: json["is_favourite"],
      orderCounts: json["order_counts"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      totalOrderNotPaid: json["total_order_not_paid"],
      totalOrderMoneyNotPaid: json["total_order_money_not_paid"],
      deliveryFees: json["delivery_fees"],
      totalOrderMoneyDiscount: json["total_order_money_discount"],
      totalOrderRestaurantMoneyNotPaid: json["total_order_restaurant_money_not_paid"],
    );
  }

  @override
  String toString(){
    return "$id, $arName, $enName, $email, $phone, $photo, $address, $latitude, $longitude, $rate, $phoneNumbers, $deliveryTime, $crNumber, $taxId, $licenceExpireDate, $legalEntityName, $status, $isFavourite, $orderCounts, $createdAt, $totalOrderNotPaid, $totalOrderMoneyNotPaid, $deliveryFees, $totalOrderMoneyDiscount, $totalOrderRestaurantMoneyNotPaid, ";
  }
}
