class OrderModel {
  bool? success;
  String? message;
  dynamic errors;
  List<Data>? data;

  OrderModel({this.success, this.message, this.errors, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    errors = json["errors"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["errors"] = errors;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  dynamic paymentId;
  int? userId;
  int? locationId;
  dynamic driverId;
  String? paymentMethod;
  String? total;
  String? deliveryFee;
  String? discount;
  String? finalTotal;
  String? status;
  dynamic cancellationReason;
  dynamic cancellationCustomReason;
  String? createdAt;
  String? updatedAt;
  List<OrderProducts>? orderProducts;
  Location? location;
  Restaurant? restaurant;
  dynamic driver;
  User? user;
  bool? isRate;
  dynamic rate;
  dynamic notes;

  Data(
      {this.id,
      this.paymentId,
      this.userId,
      this.locationId,
      this.driverId,
      this.paymentMethod,
      this.total,
      this.deliveryFee,
      this.discount,
      this.finalTotal,
      this.status,
      this.cancellationReason,
      this.cancellationCustomReason,
      this.createdAt,
      this.updatedAt,
      this.orderProducts,
      this.location,
      this.restaurant,
      this.driver,
      this.user,
      this.isRate,
      this.rate,
      this.notes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    paymentId = json["payment_id"];
    userId = json["user_id"];
    locationId = json["location_id"];
    driverId = json["driver_id"];
    paymentMethod = json["payment_method"];
    total = json["total"];
    deliveryFee = json["delivery_fee"];
    discount = json["discount"];
    finalTotal = json["final_total"];
    status = json["status"];
    cancellationReason = json["cancellation_reason"];
    cancellationCustomReason = json["cancellation_custom_reason"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    orderProducts = json["order_products"] == null
        ? null
        : (json["order_products"] as List)
            .map((e) => OrderProducts.fromJson(e))
            .toList();
    location =
        json["location"] == null ? null : Location.fromJson(json["location"]);
    restaurant = json["restaurant"] == null
        ? null
        : Restaurant.fromJson(json["restaurant"]);
    driver = json["driver"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    isRate = json["is_rate"];
    rate = json["rate"];
    notes = json["notes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["payment_id"] = paymentId;
    _data["user_id"] = userId;
    _data["location_id"] = locationId;
    _data["driver_id"] = driverId;
    _data["payment_method"] = paymentMethod;
    _data["total"] = total;
    _data["delivery_fee"] = deliveryFee;
    _data["discount"] = discount;
    _data["final_total"] = finalTotal;
    _data["status"] = status;
    _data["cancellation_reason"] = cancellationReason;
    _data["cancellation_custom_reason"] = cancellationCustomReason;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if (orderProducts != null) {
      _data["order_products"] = orderProducts?.map((e) => e.toJson()).toList();
    }
    if (location != null) {
      _data["location"] = location?.toJson();
    }
    if (restaurant != null) {
      _data["restaurant"] = restaurant?.toJson();
    }
    _data["driver"] = driver;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["is_rate"] = isRate;
    _data["rate"] = rate;
    _data["notes"] = notes;
    return _data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  dynamic latitude;
  dynamic longitude;
  dynamic address;
  dynamic countryId;
  dynamic cityId;
  String? fcmToken;
  int? isNotification;
  String? createdAt;
  String? updatedAt;
  String? image;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.latitude,
      this.longitude,
      this.address,
      this.countryId,
      this.cityId,
      this.fcmToken,
      this.isNotification,
      this.createdAt,
      this.updatedAt,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    emailVerifiedAt = json["email_verified_at"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    address = json["address"];
    countryId = json["country_id"];
    cityId = json["city_id"];
    fcmToken = json["fcm_token"];
    isNotification = json["is_notification"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["address"] = address;
    _data["country_id"] = countryId;
    _data["city_id"] = cityId;
    _data["fcm_token"] = fcmToken;
    _data["is_notification"] = isNotification;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["image"] = image;
    return _data;
  }
}

class Restaurant {
  int? id;
  String? arName;
  String? enName;
  String? email;
  String? phone;
  String? photo;
  String? address;
  String? latitude;
  String? longitude;
  int? rate;
  List<String>? phoneNumbers;
  String? deliveryTime;
  String? crNumber;
  String? taxId;
  String? licenceExpireDate;
  String? legalEntityName;
  int? status;
  bool? isFavourite;
  int? orderCounts;
  String? createdAt;

  Restaurant(
      {this.id,
      this.arName,
      this.enName,
      this.email,
      this.phone,
      this.photo,
      this.address,
      this.latitude,
      this.longitude,
      this.rate,
      this.phoneNumbers,
      this.deliveryTime,
      this.crNumber,
      this.taxId,
      this.licenceExpireDate,
      this.legalEntityName,
      this.status,
      this.isFavourite,
      this.orderCounts,
      this.createdAt});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    arName = json["ar_name"];
    enName = json["en_name"];
    email = json["email"];
    phone = json["phone"];
    photo = json["photo"];
    address = json["address"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    rate = json["rate"];
    phoneNumbers = json["phone_numbers"] == null
        ? null
        : List<String>.from(json["phone_numbers"]);
    deliveryTime = json["delivery_time"];
    crNumber = json["cr_number"];
    taxId = json["tax_id"];
    licenceExpireDate = json["licence_expire_date"];
    legalEntityName = json["legal_entity_name"];
    status = json["status"];
    isFavourite = json["is_favourite"];
    orderCounts = json["order_counts"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["ar_name"] = arName;
    _data["en_name"] = enName;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["photo"] = photo;
    _data["address"] = address;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["rate"] = rate;
    if (phoneNumbers != null) {
      _data["phone_numbers"] = phoneNumbers;
    }
    _data["delivery_time"] = deliveryTime;
    _data["cr_number"] = crNumber;
    _data["tax_id"] = taxId;
    _data["licence_expire_date"] = licenceExpireDate;
    _data["legal_entity_name"] = legalEntityName;
    _data["status"] = status;
    _data["is_favourite"] = isFavourite;
    _data["order_counts"] = orderCounts;
    _data["created_at"] = createdAt;
    return _data;
  }
}

class Location {
  int? id;
  String? name;
  String? latitude;
  String? longitude;
  String? address;
  int? status;
  String? buildingName;
  String? apartmentName;
  String? streetName;
  String? additionalDetails;
  String? phoneNumber;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Location(
      {this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.address,
      this.status,
      this.buildingName,
      this.apartmentName,
      this.streetName,
      this.additionalDetails,
      this.phoneNumber,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    address = json["address"];
    status = json["status"];
    buildingName = json["building_name"];
    apartmentName = json["apartment_name"];
    streetName = json["street_name"];
    additionalDetails = json["additional_details"];
    phoneNumber = json["phone_number"];
    userId = json["user_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["address"] = address;
    _data["status"] = status;
    _data["building_name"] = buildingName;
    _data["apartment_name"] = apartmentName;
    _data["street_name"] = streetName;
    _data["additional_details"] = additionalDetails;
    _data["phone_number"] = phoneNumber;
    _data["user_id"] = userId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class OrderProducts {
  int? productId;
  int? quantity;
  String? options;
  Product? product;

  OrderProducts({this.productId, this.quantity, this.options, this.product});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    productId = json["product_id"];
    quantity = json["quantity"];
    options = json["options"];
    product =
        json["product"] == null ? null : Product.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["product_id"] = productId;
    _data["quantity"] = quantity;
    _data["options"] = options;
    if (product != null) {
      _data["product"] = product?.toJson();
    }
    return _data;
  }
}

class Product {
  int? id;
  String? arName;
  String? enName;
  dynamic? price;
  dynamic? currentPrice;
  bool? isDiscount;
  String? timeForPreparation;
  Category? category;
  Class? classes;
  List<Options>? options;
  dynamic? description;
  String? nutritionalInformation;
  String? ingredients;
  dynamic? discount;
  dynamic? discountStart;
  dynamic? discountEnd;
  int? status;
  dynamic? rate;
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
