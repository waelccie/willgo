class SendOtpModel {
  bool? success;
  String? message;
  List<String>? errors;
  Data? data;

  SendOtpModel({this.success, this.message, this.errors, this.data});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
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

  static List<SendOtpModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(SendOtpModel.fromJson).toList();
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

  SendOtpModel copyWith({
    bool? success,
    String? message,
    List<String>? errors,
    Data? data,
  }) =>
      SendOtpModel(
        success: success ?? this.success,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        data: data ?? this.data,
      );
}

class Data {
  int? id;
  String? phone;
  String? otp;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.phone,
      this.otp,
      this.expiresAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["otp"] is String) {
      otp = json["otp"];
    }
    if (json["expires_at"] is String) {
      expiresAt = json["expires_at"];
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
    _data["phone"] = phone;
    _data["otp"] = otp;
    _data["expires_at"] = expiresAt;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }

  Data copyWith({
    int? id,
    String? phone,
    String? otp,
    String? expiresAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        otp: otp ?? this.otp,
        expiresAt: expiresAt ?? this.expiresAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
