class SetPrimaryLocatiom {
  SetPrimaryLocatiom({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final Data? data;

  factory SetPrimaryLocatiom.fromJson(Map<String, dynamic> json) {
    return SetPrimaryLocatiom(
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
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.status,
    required this.buildingName,
    required this.apartmentName,
    required this.streetName,
    required this.additionalDetails,
    required this.phoneNumber,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? latitude;
  final String? longitude;
  final String? address;
  final int? status;
  final String? buildingName;
  final String? apartmentName;
  final String? streetName;
  final String? additionalDetails;
  final String? phoneNumber;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      name: json["name"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      address: json["address"],
      status: json["status"],
      buildingName: json["building_name"],
      apartmentName: json["apartment_name"],
      streetName: json["street_name"],
      additionalDetails: json["additional_details"],
      phoneNumber: json["phone_number"],
      userId: json["user_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
