// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SendOtpPararmeters {
  final String phone;
  SendOtpPararmeters({
    required this.phone,
  });

  SendOtpPararmeters copyWith({
    String? phone,
  }) {
    return SendOtpPararmeters(
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
    };
  }

  factory SendOtpPararmeters.fromMap(Map<String, dynamic> map) {
    return SendOtpPararmeters(
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendOtpPararmeters.fromJson(String source) =>
      SendOtpPararmeters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SendOtpPararmeters(phone: $phone)';

  @override
  bool operator ==(covariant SendOtpPararmeters other) {
    if (identical(this, other)) return true;

    return other.phone == phone;
  }

  @override
  int get hashCode => phone.hashCode;
}

class SendOtpPassPararmeters {
  final String phone;
  final String otp;

  SendOtpPassPararmeters({
    required this.phone,
    required this.otp,
  });

  SendOtpPassPararmeters copyWith({
    String? phone,
    String? otp,
  }) {
    return SendOtpPassPararmeters(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'otp': otp,
    };
  }

  factory SendOtpPassPararmeters.fromMap(Map<String, dynamic> map) {
    return SendOtpPassPararmeters(
      phone: map['phone'] as String,
      otp: map['otp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendOtpPassPararmeters.fromJson(String source) =>
      SendOtpPassPararmeters.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SendOtpPassPararmeters(phone: $phone, otp: $otp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SendOtpPassPararmeters &&
        other.phone == phone &&
        other.otp == otp;
  }

  @override
  int get hashCode => Object.hash(phone, otp);
}
