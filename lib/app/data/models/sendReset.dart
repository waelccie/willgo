class SendRestPasswordOtp {
  SendRestPasswordOtp({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final Data? data;

  factory SendRestPasswordOtp.fromJson(Map<String, dynamic> json) {
    return SendRestPasswordOtp(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.otp,
    required this.message,
  });

  final Otp? otp;
  final String? message;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      otp: json["otp"] == null ? null : Otp.fromJson(json["otp"]),
      message: json["message"],
    );
  }
}

class Otp {
  Otp({
    required this.phone,
    required this.otp,
    required this.expiresAt,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String? phone;
  final int? otp;
  final DateTime? expiresAt;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  factory Otp.fromJson(Map<String, dynamic> json) {
    return Otp(
      phone: json["phone"],
      otp: json["otp"],
      expiresAt: DateTime.tryParse(json["expires_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
    );
  }
}
