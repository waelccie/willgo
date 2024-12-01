import 'dart:convert';

class OtpParameters {
  final String otp;
  final String phone;

  OtpParameters({
    required this.otp,
    required this.phone,
  });

  OtpParameters copyWith({
    String? otp,
    String? phone,
  }) {
    return OtpParameters(
      otp: otp ?? this.otp,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'otp': otp,
      'phone': phone,
    };
  }

  factory OtpParameters.fromMap(Map<String, dynamic> map) {
    return OtpParameters(
      otp: map['otp'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtpParameters.fromJson(String source) =>
      OtpParameters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OtpParameters(otp: $otp, phone: $phone)';

  @override
  bool operator ==(covariant OtpParameters other) {
    if (identical(this, other)) return true;

    return other.otp == otp && other.phone == phone;
  }

  @override
  int get hashCode => otp.hashCode ^ phone.hashCode;
}
