class OrderDetailsModel {
  OrderDetailsModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final Data? data;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.paymentId,
    required this.userId,
    required this.locationId,
    required this.driverId,
    required this.paymentMethod,
    required this.total,
    required this.deliveryFee,
    required this.discount,
    required this.finalTotal,
    required this.status,
    required this.cancellationReason,
    required this.cancellationCustomReason,
    required this.createdAt,
    required this.updatedAt,
    required this.orderProducts,
    required this.location,
    required this.restaurant,
    required this.driver,
    required this.user,
    required this.isRate,
    required this.rate,
  });

  final int? id;
  final dynamic paymentId;
  final int? userId;
  final int? locationId;
  final dynamic driverId;
  final String? paymentMethod;
  final String? total;
  final String? deliveryFee;
  final String? discount;
  final String? finalTotal;
  final String? status;
  final dynamic cancellationReason;
  final dynamic cancellationCustomReason;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic> orderProducts;
  final Location? location;
  final Restaurant? restaurant;
  final dynamic driver;
  final User? user;
  final bool? isRate;
  final dynamic rate;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      paymentId: json["payment_id"],
      userId: json["user_id"],
      locationId: json["location_id"],
      driverId: json["driver_id"],
      paymentMethod: json["payment_method"],
      total: json["total"],
      deliveryFee: json["delivery_fee"],
      discount: json["discount"],
      finalTotal: json["final_total"],
      status: json["status"],
      cancellationReason: json["cancellation_reason"],
      cancellationCustomReason: json["cancellation_custom_reason"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      orderProducts: json["order_products"] == null
          ? []
          : List<dynamic>.from(json["order_products"]!.map((x) => x)),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      restaurant: json["restaurant"] == null
          ? null
          : Restaurant.fromJson(json["restaurant"]),
      driver: json["driver"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      isRate: json["is_rate"],
      rate: json["rate"],
    );
  }
}

class Location {
  Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.status,
    required this.buildingName,
    required this.apartmentName,
    required this.streetName,
    required this.additionalDetails,
    required this.phoneNumber,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? latitude;
  final String? longitude;
  final String? address;
  final int? status;
  final String? buildingName;
  final String? apartmentName;
  final String? streetName;
  final String? additionalDetails;
  final String? phoneNumber;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["id"],
      name: json["name"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      address: json["address"],
      status: json["status"],
      buildingName: json["building_name"],
      apartmentName: json["apartment_name"],
      streetName: json["street_name"],
      additionalDetails: json["additional_details"],
      phoneNumber: json["phone_number"],
      userId: json["user_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
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

  factory Restaurant.fromJson(Map<String, dynamic> json) {
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
    );
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.countryId,
    required this.cityId,
    required this.fcmToken,
    required this.isNotification,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic emailVerifiedAt;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic address;
  final dynamic countryId;
  final dynamic cityId;
  final String? fcmToken;
  final int? isNotification;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? image;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      emailVerifiedAt: json["email_verified_at"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      address: json["address"],
      countryId: json["country_id"],
      cityId: json["city_id"],
      fcmToken: json["fcm_token"],
      isNotification: json["is_notification"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      image: json["image"],
    );
  }
}
