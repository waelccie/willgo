import 'dart:convert';

class NewLoaction {
  final String address;
  final String name;

  final String latitude;
  final String longitude;
  final String? buildingName;
  final String? apartmentName;
  final String? streetName;
  final String? additionalDetails;
  final String phoneNumber;

  NewLoaction({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.name,
    this.buildingName,
    this.apartmentName,
    this.streetName,
    this.additionalDetails,
    required this.phoneNumber,
  });

  NewLoaction copyWith({
    String? address,
    String? name,
    String? latitude,
    String? longitude,
    String? buildingName,
    String? apartmentName,
    String? streetName,
    String? additionalDetails,
    String? phoneNumber,
  }) {
    return NewLoaction(
      address: address ?? this.address,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      buildingName: buildingName ?? this.buildingName,
      apartmentName: apartmentName ?? this.apartmentName,
      streetName: streetName ?? this.streetName,
      additionalDetails: additionalDetails ?? this.additionalDetails,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'building_name': buildingName,
      'apartment_name': apartmentName,
      'street_name': streetName,
      'additional_details': additionalDetails,
      'phone_number': phoneNumber,
    };
  }

  factory NewLoaction.fromMap(Map<String, dynamic> map) {
    return NewLoaction(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      buildingName: map['building_name'],
      apartmentName: map['apartment_name'],
      streetName: map['street_name'],
      additionalDetails: map['additional_details'],
      phoneNumber: map['phone_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewLoaction.fromJson(String source) =>
      NewLoaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewLoaction(name: $name,address: $address, latitude: $latitude, longitude: $longitude, buildingName: $buildingName, apartmentName: $apartmentName, streetName: $streetName, additionalDetails: $additionalDetails, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewLoaction &&
        other.name == name &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.buildingName == buildingName &&
        other.apartmentName == apartmentName &&
        other.streetName == streetName &&
        other.additionalDetails == additionalDetails &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        name.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        buildingName.hashCode ^
        apartmentName.hashCode ^
        streetName.hashCode ^
        additionalDetails.hashCode ^
        phoneNumber.hashCode;
  }
}
