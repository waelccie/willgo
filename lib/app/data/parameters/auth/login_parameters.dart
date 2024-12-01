// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginParameters {
  final String phone;
  final String password;
  final bool remember;
  LoginParameters({
    required this.phone,
    required this.password,
    required this.remember,
  });

  LoginParameters copyWith({
    String? phone,
    String? password,
    bool? remember,
  }) {
    return LoginParameters(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      remember: remember ?? this.remember,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
      'remember': remember,
    };
  }

  factory LoginParameters.fromMap(Map<String, dynamic> map) {
    return LoginParameters(
      phone: map['phone'] as String,
      password: map['password'] as String,
      remember: map['remember'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParameters.fromJson(String source) =>
      LoginParameters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginParameters(phone: $phone, password: $password, remember: $remember)';

  @override
  bool operator ==(covariant LoginParameters other) {
    if (identical(this, other)) return true;

    return other.phone == phone &&
        other.password == password &&
        other.remember == remember;
  }

  @override
  int get hashCode => phone.hashCode ^ password.hashCode ^ remember.hashCode;
}
