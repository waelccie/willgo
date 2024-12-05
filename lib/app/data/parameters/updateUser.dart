// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserUpdate {
  final String name;
  final String phone;
  final String email;

  UserUpdate({
    required this.name,
    required this.phone,
    required this.email,
  });

  UserUpdate copyWith({String? name, String? phone, String? email}) {
    return UserUpdate(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory UserUpdate.fromMap(Map<String, dynamic> map) {
    return UserUpdate(
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserUpdate.fromJson(String source) =>
      UserUpdate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserUpdate(name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(covariant UserUpdate other) {
    if (identical(this, other)) return true;

    return other.name == name && other.phone == phone && other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^ phone.hashCode ^ email.hashCode;
  }
}
