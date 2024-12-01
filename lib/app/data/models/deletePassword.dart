import 'dart:convert';

class LoginParameters {
  final String phone;
  final String password;

  LoginParameters({
    required this.phone,
    required this.password,
  });

  LoginParameters copyWith({
    String? phone,
    String? password,
  }) {
    return LoginParameters(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
    };
  }

  factory LoginParameters.fromMap(Map<String, dynamic> map) {
    return LoginParameters(
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParameters.fromJson(String source) =>
      LoginParameters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginParameters(phone: $phone, password: $password)';

  @override
  bool operator ==(covariant LoginParameters other) {
    if (identical(this, other)) return true;

    return other.phone == phone &&
        other.password == password;
  }

  @override
  int get hashCode => phone.hashCode ^ password.hashCode;
}