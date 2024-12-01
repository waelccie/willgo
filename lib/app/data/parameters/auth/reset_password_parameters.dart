// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetPasswordParameters {
  final String phone;
  final String otp;

  final String newPassword;
  final String confirmPassword;
  ResetPasswordParameters({
    required this.phone,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });

  ResetPasswordParameters copyWith({
    String? phone,
    String? newPassword,
    String? confirmPassword,
    String ?otp
  }) {
    return ResetPasswordParameters(
      otp: otp ?? this.otp,
      phone: phone ?? this.phone,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
      'otp': otp,

    };
  }

  factory ResetPasswordParameters.fromMap(Map<String, dynamic> map) {
    return ResetPasswordParameters(
      otp:map['otp'] as String,
      phone: map['phone'] as String,
      newPassword: map['new_password'] as String,
      confirmPassword: map['confirm_password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordParameters.fromJson(String source) =>
      ResetPasswordParameters.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResetPasswordParameters(phone: $phone, new_password: $newPassword, confirm_password: $confirmPassword)';

  @override
  bool operator ==(covariant ResetPasswordParameters other) {
    if (identical(this, other)) return true;

    return other.phone == phone &&
        other.newPassword == newPassword &&
        other.otp == otp &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode =>
      phone.hashCode ^  otp.hashCode ^ newPassword.hashCode ^ confirmPassword.hashCode;
}
