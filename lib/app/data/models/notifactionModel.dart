class NotifactionModel {
  NotifactionModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final List<Datum> data;

  factory NotifactionModel.fromJson(Map<String, dynamic> json){
    return NotifactionModel(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  @override
  String toString(){
    return "$success, $message, $errors, $data, ";
  }
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.data,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? status;
  final Data? data;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  @override
  String toString(){
    return "$id, $title, $description, $status, $data, $createdAt, $updatedAt, ";
  }
}

class Data {
  Data({
    required this.typeId,
    required this.typeName,
  });

  final int? typeId;
  final String? typeName;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      typeId: json["type_id"],
      typeName: json["type_name"],
    );
  }

  @override
  String toString(){
    return "$typeId, $typeName, ";
  }
}
