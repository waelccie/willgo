// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class searcParaneter {
  final String name;
  searcParaneter({
    required this.name,
  });

  searcParaneter copyWith({
    String? name,
  }) {
    return searcParaneter(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory searcParaneter.fromMap(Map<String, dynamic> map) {
    return searcParaneter(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory searcParaneter.fromJson(String source) => searcParaneter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'searcParaneter(name: $name)';

  @override
  bool operator ==(covariant searcParaneter other) {
    if (identical(this, other)) return true;

    return
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
