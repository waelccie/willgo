import 'dart:convert';

class PaymentParameters {
  final String locationId;
  final String paymentMethod; // يمكن أن يكون 'cash' أو 'payment'

  PaymentParameters({
    required this.locationId,
    required this.paymentMethod,
  });

  PaymentParameters copyWith({
    String? locationId,
    String? paymentMethod,
  }) {
    return PaymentParameters(
      locationId: locationId ?? this.locationId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location_id': locationId,
      'payment_method': paymentMethod,
    };
  }

  factory PaymentParameters.fromMap(Map<String, dynamic> map) {
    return PaymentParameters(
      locationId: map['location_id'] as String,
      paymentMethod: map['payment_method'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentParameters.fromJson(String source) =>
      PaymentParameters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PaymentParameters(locationId: $locationId, paymentMethod: $paymentMethod)';

  @override
  bool operator ==(covariant PaymentParameters other) {
    if (identical(this, other)) return true;

    return other.locationId == locationId &&
        other.paymentMethod == paymentMethod;
  }

  @override
  int get hashCode => locationId.hashCode ^ paymentMethod.hashCode;
}
