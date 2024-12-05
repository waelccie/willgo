// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VerifyOtpParameters {
  final String phone;
  final String otp;
  final String? name;
  final String? email;
  final String? password;
  final String? passwordConfirmation;
  final bool? terms;

  VerifyOtpParameters({
    required this.phone,
    required this.otp,
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.terms,
  });

  VerifyOtpParameters copyWith({
    String? phone,
    String? otp,
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
    bool? terms,
  }) {
    return VerifyOtpParameters(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      terms: terms ?? this.terms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'otp': otp,
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'terms': terms,
    };
  }

  factory VerifyOtpParameters.fromMap(Map<String, dynamic> map) {
    return VerifyOtpParameters(
      phone: map['phone'] as String,
      otp: map['otp'] as String,
      name: map['name'] as String?,
      email: map['email'] as String?,
      password: map['password'] as String?,
      passwordConfirmation: map['password_confirmation'] as String?,
      terms: map['terms'] as bool?,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpParameters.fromJson(String source) =>
      VerifyOtpParameters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VerifyOtpParameters(phone: $phone, otp: $otp, name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, terms: $terms)';
  }

  @override
  bool operator ==(covariant VerifyOtpParameters other) {
    if (identical(this, other)) return true;

    return other.phone == phone &&
        other.otp == otp &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.passwordConfirmation == passwordConfirmation &&
        other.terms == terms;
  }

  @override
  int get hashCode {
    return phone.hashCode ^
        otp.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        passwordConfirmation.hashCode ^
        terms.hashCode;
  }
}
