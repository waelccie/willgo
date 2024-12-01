class RestaurantsModel {
  bool? success;
  String? message;
  List<String>? errors;
  List<Restaurant>? data;

  RestaurantsModel({this.success, this.message, this.errors, this.data});

  RestaurantsModel.fromJson(Map<String, dynamic> json) {
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
          : (json["data"] as List).map((e) => Restaurant.fromJson(e)).toList();
    }
  }

  static List<RestaurantsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(RestaurantsModel.fromJson).toList();
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

  RestaurantsModel copyWith({
    bool? success,
    String? message,
    List<String>? errors,
    List<Restaurant>? data,
  }) =>
      RestaurantsModel(
        success: success ?? this.success,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        data: data ?? this.data,
      );
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
  String? deliveryTime;
  String? crNumber;
  String? taxId;
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
      this.deliveryTime,
      this.crNumber,
      this.taxId,
      this.status,
      this.isFavourite,
      this.orderCounts,
      this.createdAt});

  Restaurant.fromJson(Map<String, dynamic> json) {
    if (json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if (json["ar_name"] is String) {
      arName = json["ar_name"];
    }
    if (json["en_name"] is String) {
      enName = json["en_name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["photo"] is String) {
      photo = json["photo"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["latitude"] is String) {
      latitude = json["latitude"];
    }
    if (json["longitude"] is String) {
      longitude = json["longitude"];
    }
    if (json["rate"] is num) {
      rate = (json["rate"] as num).toInt();
    }
    if (json["delivery_time"] is String) {
      deliveryTime = json["delivery_time"];
    }
    if (json["cr_number"] is String) {
      crNumber = json["cr_number"];
    }
    if (json["tax_id"] is String) {
      taxId = json["tax_id"];
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["is_favourite"] is bool) {
      isFavourite = json["is_favourite"];
    }
    if (json["order_counts"] is num) {
      orderCounts = (json["order_counts"] as num).toInt();
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
  }

  static List<Restaurant> fromList(List<Map<String, dynamic>> list) {
    return list.map(Restaurant.fromJson).toList();
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
    _data["delivery_time"] = deliveryTime;
    _data["cr_number"] = crNumber;
    _data["tax_id"] = taxId;
    _data["status"] = status;
    _data["is_favourite"] = isFavourite;
    _data["order_counts"] = orderCounts;
    _data["created_at"] = createdAt;
    return _data;
  }

  Restaurant copyWith({
    int? id,
    String? arName,
    String? enName,
    String? email,
    String? phone,
    String? photo,
    String? address,
    String? latitude,
    String? longitude,
    int? rate,
    String? deliveryTime,
    String? crNumber,
    String? taxId,
    int? status,
    bool? isFavourite,
    int? orderCounts,
    String? createdAt,
  }) =>
      Restaurant(
        id: id ?? this.id,
        arName: arName ?? this.arName,
        enName: enName ?? this.enName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        photo: photo ?? this.photo,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        rate: rate ?? this.rate,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        crNumber: crNumber ?? this.crNumber,
        taxId: taxId ?? this.taxId,
        status: status ?? this.status,
        isFavourite: isFavourite ?? this.isFavourite,
        orderCounts: orderCounts ?? this.orderCounts,
        createdAt: createdAt ?? this.createdAt,
      );
}
