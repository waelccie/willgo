class DeleteItem {
  DeleteItem({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final String? data;

  factory DeleteItem.fromJson(Map<String, dynamic> json) {
    return DeleteItem(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"],
    );
  }
}
