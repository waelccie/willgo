class RegisterModel {
  bool? success;
  String? message;
  List<String>? errors;
  Data? data;

  RegisterModel({this.success, this.message, this.errors, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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

  static List<RegisterModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(RegisterModel.fromJson).toList();
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

  RegisterModel copyWith({
    bool? success,
    String? message,
    List<String>? errors,
    Data? data,
  }) =>
      RegisterModel(
        success: success ?? this.success,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        data: data ?? this.data,
      );
}

class Data {
  User? user;
  Otp? otp;
  String? token;

  Data({this.user, this.otp, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["otp"] is Map) {
      otp = json["otp"] == null ? null : Otp.fromJson(json["otp"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    if (otp != null) {
      _data["otp"] = otp?.toJson();
    }
    _data["token"] = token;
    return _data;
  }

  Data copyWith({
    User? user,
    Otp? otp,
    String? token,
  }) =>
      Data(
        user: user ?? this.user,
        otp: otp ?? this.otp,
        token: token ?? this.token,
      );
}

class Otp {
  String? phone;
  int? otp;
  String? expiresAt;
  String? updatedAt;
  String? createdAt;
  int? id;

  Otp(
      {this.phone,
      this.otp,
      this.expiresAt,
      this.updatedAt,
      this.createdAt,
      this.id});

  Otp.fromJson(Map<String, dynamic> json) {
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["otp"] is num) {
      otp = (json["otp"] as num).toInt();
    }
    if (json["expires_at"] is String) {
      expiresAt = json["expires_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
  }

  static List<Otp> fromList(List<Map<String, dynamic>> list) {
    return list.map(Otp.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["phone"] = phone;
    _data["otp"] = otp;
    _data["expires_at"] = expiresAt;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }

  Otp copyWith({
    String? phone,
    int? otp,
    String? expiresAt,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) =>
      Otp(
        phone: phone ?? this.phone,
        otp: otp ?? this.otp,
        expiresAt: expiresAt ?? this.expiresAt,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );
}

class User {
  String? name;
  String? phone;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.name,
      this.phone,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map(User.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["phone"] = phone;
    _data["email"] = email;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }

  User copyWith({
    String? name,
    String? phone,
    String? email,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) =>
      User(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );
}
