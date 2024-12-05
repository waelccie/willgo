// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SupportRequestParameters {
  final String name;
  final String email;
  final String note;

  SupportRequestParameters({
    required this.name,
    required this.email,
    required this.note,
  });

  SupportRequestParameters copyWith({
    String? name,
    String? email,
    String? note,
  }) {
    return SupportRequestParameters(
      name: name ?? this.name,
      email: email ?? this.email,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'note': note,
    };
  }

  factory SupportRequestParameters.fromMap(Map<String, dynamic> map) {
    return SupportRequestParameters(
      name: map['name'] as String,
      email: map['email'] as String,
      note: map['note'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupportRequestParameters.fromJson(String source) =>
      SupportRequestParameters.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SupportRequestParameters(name: $name, email: $email, note: $note)';

  @override
  bool operator ==(covariant SupportRequestParameters other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.note == note;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ note.hashCode;
}
