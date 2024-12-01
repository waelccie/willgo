// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpadeCartParameters {
  final String quantity;

  UpadeCartParameters({
    required this.quantity,

  });

  UpadeCartParameters copyWith({
    String? quantity,

  }) {
    return UpadeCartParameters(
      quantity: quantity ?? this.quantity,

    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,

    };
  }

  factory UpadeCartParameters.fromMap(Map<String, dynamic> map) {
    return UpadeCartParameters(
      quantity: map['quantity'] as String,

    );
  }

  String toJson() => json.encode(toMap());

  factory UpadeCartParameters.fromJson(String source) =>
      UpadeCartParameters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UpadeCartParameters(quantity: $quantity)';

  @override
  bool operator ==(covariant UpadeCartParameters other) {
    if (identical(this, other)) return true;

    return other.quantity == quantity ;
  }

  @override
  int get hashCode => quantity.hashCode ;
}
