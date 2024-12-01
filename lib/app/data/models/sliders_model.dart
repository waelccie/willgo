class SlidersModel {
  bool? success;
  String? message;
  List<String>? errors;
  List<Slider>? data;

  SlidersModel({this.success, this.message, this.errors, this.data});

  SlidersModel.fromJson(Map<String, dynamic> json) {
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
          : (json["data"] as List).map((e) => Slider.fromJson(e)).toList();
    }
  }

  static List<SlidersModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(SlidersModel.fromJson).toList();
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

  SlidersModel copyWith({
    bool? success,
    String? message,
    List<String>? errors,
    List<Slider>? data,
  }) =>
      SlidersModel(
        success: success ?? this.success,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        data: data ?? this.data,
      );
}

class Slider {
  int? id;
  String? title;
  String? description;
  int? status;
  String? image;
  String? createdAt;

  Slider(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.image,
      this.createdAt});

  Slider.fromJson(Map<String, dynamic> json) {
    if (json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
  }

  static List<Slider> fromList(List<Map<String, dynamic>> list) {
    return list.map(Slider.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["status"] = status;
    _data["image"] = image;
    _data["created_at"] = createdAt;
    return _data;
  }

  Slider copyWith({
    int? id,
    String? title,
    String? description,
    int? status,
    String? image,
    String? createdAt,
  }) =>
      Slider(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        status: status ?? this.status,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
      );
}
