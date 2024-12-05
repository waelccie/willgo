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
  final List<Datum> data;

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
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
    required this.arName,
    required this.enName,
    required this.email,
    required this.phone,
    required this.country,
    required this.city,
    required this.zone,
    required this.plan,
    required this.classes,
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
  final City? country;
  final City? city;
  final City? zone;
  final Plan? plan;
  final List<Class> classes;
  final String? address;
  final String? latitude;
  final String? longitude;
  final int? rate;
  final List<String> phoneNumbers;
  final String? deliveryTime;
  final String? crNumber;
  final String? taxId;
  final DateTime? licenceExpireDate;
  final String? legalEntityName;
  final int? status;
  final bool? isFavourite;
  final int? orderCounts;
  final DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      arName: json["ar_name"],
      enName: json["en_name"],
      email: json["email"],
      phone: json["phone"],
      country: json["country"] == null ? null : City.fromJson(json["country"]),
      city: json["city"] == null ? null : City.fromJson(json["city"]),
      zone: json["zone"] == null ? null : City.fromJson(json["zone"]),
      plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
      classes: json["classes"] == null
          ? []
          : List<Class>.from(json["classes"]!.map((x) => Class.fromJson(x))),
      address: json["address"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      rate: json["rate"],
      phoneNumbers: json["phone_numbers"] == null
          ? []
          : List<String>.from(json["phone_numbers"]!.map((x) => x)),
      deliveryTime: json["delivery_time"],
      crNumber: json["cr_number"],
      taxId: json["tax_id"],
      licenceExpireDate: DateTime.tryParse(json["licence_expire_date"] ?? ""),
      legalEntityName: json["legal_entity_name"],
      status: json["status"],
      isFavourite: json["is_favourite"],
      orderCounts: json["order_counts"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }
}

class City {
  City({
    required this.id,
    required this.arName,
    required this.enName,
    required this.status,
    required this.country,
    required this.zones,
    required this.createdAt,
    required this.updatedAt,
    required this.coordinates,
    required this.productCounts,
  });

  final int? id;
  final String? arName;
  final String? enName;
  final int? status;
  final City? country;
  final List<City> zones;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic? coordinates;
  final int? productCounts;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"],
      arName: json["ar_name"],
      enName: json["en_name"],
      status: json["status"],
      country: json["country"] == null ? null : City.fromJson(json["country"]),
      zones: json["zones"] == null
          ? []
          : List<City>.from(json["zones"]!.map((x) => City.fromJson(x))),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      coordinates: json["coordinates"],
      productCounts: json["product_counts"],
    );
  }
}

class Coordinate {
  Coordinate({
    required this.lat,
    required this.long,
  });

  final String? lat;
  final String? long;

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      lat: json["lat"],
      long: json["long"],
    );
  }
}

class CoordinatesClass {
  CoordinatesClass({
    required this.lat,
    required this.lng,
  });

  final int? lat;
  final int? lng;

  factory CoordinatesClass.fromJson(Map<String, dynamic> json) {
    return CoordinatesClass(
      lat: json["lat"],
      lng: json["lng"],
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

class Plan {
  Plan({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.driverPercentage,
    required this.driverPercentageUnit,
    required this.priceRanges,
    required this.discountPlan,
    required this.discountPlanUnit,
    required this.discountPeriodNumber,
    required this.discountPeriod,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String? driverPercentage;
  final String? driverPercentageUnit;
  final dynamic? priceRanges;
  final String? discountPlan;
  final String? discountPlanUnit;
  final int? discountPeriodNumber;
  final String? discountPeriod;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json["id"],
      nameAr: json["name_ar"],
      nameEn: json["name_en"],
      driverPercentage: json["driver_percentage"],
      driverPercentageUnit: json["driver_percentage_unit"],
      priceRanges: json["price_ranges"],
      discountPlan: json["discount_plan"],
      discountPlanUnit: json["discount_plan_unit"],
      discountPeriodNumber: json["discount_period_number"],
      discountPeriod: json["discount_period"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class PriceRange {
  PriceRange({
    required this.distanceFrom,
    required this.distanceTo,
    required this.distanceUnit,
    required this.priceForRange,
    required this.priceUnit,
  });

  final String? distanceFrom;
  final String? distanceTo;
  final String? distanceUnit;
  final String? priceForRange;
  final String? priceUnit;

  factory PriceRange.fromJson(Map<String, dynamic> json) {
    return PriceRange(
      distanceFrom: json["distance_from"],
      distanceTo: json["distance_to"],
      distanceUnit: json["distance_unit"],
      priceForRange: json["price_for_range"],
      priceUnit: json["price_unit"],
    );
  }
}

class PriceRangesClass {
  PriceRangesClass({
    required this.min,
    required this.max,
  });

  final int? min;
  final int? max;

  factory PriceRangesClass.fromJson(Map<String, dynamic> json) {
    return PriceRangesClass(
      min: json["min"],
      max: json["max"],
    );
  }
}
