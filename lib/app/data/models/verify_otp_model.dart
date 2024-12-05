class RegisterAfteOtp {
  RegisterAfteOtp({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final Data? data;

  factory RegisterAfteOtp.fromJson(Map<String, dynamic> json) {
    return RegisterAfteOtp(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  final User? user;
  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      token: json["token"],
    );
  }
}

class User {
  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String? name;
  final String? phone;
  final String? email;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
    );
  }
}
