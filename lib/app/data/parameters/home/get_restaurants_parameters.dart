// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetRestaurantsParameters {
  final double latitude;
  final double longitude;
  final double? radius;
  final int page;
  final String? search;
  final int? rate;
  final int? isPopular;
  GetRestaurantsParameters({
    required this.latitude,
    required this.longitude,
    this.radius,
    required this.page,
    this.search,
    this.rate,
    this.isPopular,
  });

  GetRestaurantsParameters copyWith({
    double? latitude,
    double? longitude,
    double? radius,
    int? page,
    String? search,
    int? rate,
    int? isPopular,
  }) {
    return GetRestaurantsParameters(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      radius: radius ?? this.radius,
      page: page ?? this.page,
      search: search ?? this.search,
      rate: rate ?? this.rate,
      isPopular: isPopular ?? this.isPopular,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'radius': radius,
      'page': page,
      'search': search,
      'rate': rate,
      'isPopular': isPopular,
    };
  }

  factory GetRestaurantsParameters.fromMap(Map<String, dynamic> map) {
    return GetRestaurantsParameters(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      radius: map['radius'] != null ? map['radius'] as double : null,
      page: map['page'] as int,
      search: map['search'] != null ? map['search'] as String : null,
      rate: map['rate'] != null ? map['rate'] as int : null,
      isPopular: map['isPopular'] != null ? map['isPopular'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetRestaurantsParameters.fromJson(String source) =>
      GetRestaurantsParameters.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetRestaurantsParameters(latitude: $latitude, longitude: $longitude, radius: $radius, page: $page, search: $search, rate: $rate, isPopular: $isPopular)';
  }

  @override
  bool operator ==(covariant GetRestaurantsParameters other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.radius == radius &&
        other.page == page &&
        other.search == search &&
        other.rate == rate &&
        other.isPopular == isPopular;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
        longitude.hashCode ^
        radius.hashCode ^
        page.hashCode ^
        search.hashCode ^
        rate.hashCode ^
        isPopular.hashCode;
  }
}
