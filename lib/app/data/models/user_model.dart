class UserModel {
  bool? success;
  String? message;
  List<String>? errors;
  Data? data;

  UserModel({this.success, this.message, this.errors, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
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
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
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

  UserModel copyWith({
    bool? success,
    String? message,
    List<String>? errors,
    Data? data,
  }) =>
      UserModel(
        success: success ?? this.success,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        data: data ?? this.data,
      );
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  int? latitude;
  int? longitude;
  String? address;
  int? countryId;
  int? cityId;
  String? fcmToken;
  int? isNotification;
  String? createdAt;
  String? updatedAt;

  Data(
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
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["email_verified_at"] is String) {
      emailVerifiedAt = json["email_verified_at"];
    }
    if (json["latitude"] is num) {
      latitude = (json["latitude"] as num).toInt();
    }
    if (json["longitude"] is num) {
      longitude = (json["longitude"] as num).toInt();
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["country_id"] is num) {
      countryId = (json["country_id"] as num).toInt();
    }
    if (json["city_id"] is num) {
      cityId = (json["city_id"] as num).toInt();
    }
    if (json["fcm_token"] is String) {
      fcmToken = json["fcm_token"];
    }
    if (json["is_notification"] is num) {
      isNotification = (json["is_notification"] as num).toInt();
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
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
    return _data;
  }

  Data copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? emailVerifiedAt,
    int? latitude,
    int? longitude,
    String? address,
    int? countryId,
    int? cityId,
    String? fcmToken,
    int? isNotification,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        countryId: countryId ?? this.countryId,
        cityId: cityId ?? this.cityId,
        fcmToken: fcmToken ?? this.fcmToken,
        isNotification: isNotification ?? this.isNotification,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
