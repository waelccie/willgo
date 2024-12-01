// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterParameters {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;
  final bool terms;
  RegisterParameters({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.terms,
  });

  RegisterParameters copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? passwordConfirmation,
    bool? terms,
  }) {
    return RegisterParameters(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      terms: terms ?? this.terms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'terms': terms,
    };
  }

  factory RegisterParameters.fromMap(Map<String, dynamic> map) {
    return RegisterParameters(
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      passwordConfirmation: map['password_confirmation'] as String,
      terms: map['terms'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterParameters.fromJson(String source) =>
      RegisterParameters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterParameters(name: $name, phone: $phone, email: $email, password: $password, password_confirmation: $passwordConfirmation, terms: $terms)';
  }

  @override
  bool operator ==(covariant RegisterParameters other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.passwordConfirmation == passwordConfirmation &&
        other.terms == terms;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode ^
        passwordConfirmation.hashCode ^
        terms.hashCode;
  }
}
