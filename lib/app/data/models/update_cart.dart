class UpdateCart {
  UpdateCart({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final dynamic? data;

  factory UpdateCart.fromJson(Map<String, dynamic> json) {
    return UpdateCart(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"],
    );
  }
}
