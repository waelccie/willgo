
class SupportRequestsResponse {
  bool? success;
  String? message;
  dynamic errors;
  List<SupportRequestModel>? data;

  SupportRequestsResponse({
    this.success,
    this.message,
    this.errors,
    this.data,
  });

  factory SupportRequestsResponse.fromJson(Map<String, dynamic> json) {
    return SupportRequestsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      errors: json['errors'] as dynamic,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SupportRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'errors': errors,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
class SupportRequestModel {
  int? id;
  String? name;
  String? email;
  String? note;
  dynamic answer;
  DateTime? createdAt;
  DateTime? updatedAt;

  SupportRequestModel({
    this.id,
    this.name,
    this.email,
    this.note,
    this.answer,
    this.createdAt,
    this.updatedAt,
  });

  factory SupportRequestModel.fromJson(Map<String, dynamic> json) => SupportRequestModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        note: json['note'] as String?,
        answer: json['answer'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'note': note,
        'answer': answer,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

