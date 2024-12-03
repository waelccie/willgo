import 'dart:convert';

class LatLng {
  final double latitude;
  final double longitude;

  LatLng({
    required this.latitude,
    required this.longitude,
  });

  LatLng copyWith({
    double? latitude,
    double? longitude,
  }) {
    return LatLng(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LatLng.fromMap(Map<String, dynamic> map) {
    return LatLng(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLng.fromJson(String source) =>
      LatLng.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LatLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant LatLng other) {
    if (identical(this, other)) return true;
    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^ longitude.hashCode;
  }
}