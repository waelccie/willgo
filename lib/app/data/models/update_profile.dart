class UpdateProfie {
  UpdateProfie({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final Data? data;

  factory UpdateProfie.fromJson(Map<String, dynamic> json){
    return UpdateProfie(
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

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
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
    );
  }

}
