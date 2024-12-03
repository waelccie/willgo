class CheckOutModel {
  CheckOutModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic errors;
  final List<Datum> data;

  factory CheckOutModel.fromJson(Map<String, dynamic> json){
    return CheckOutModel(
      success: json["success"],
      message: json["message"],
      errors: json["errors"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.userId,
    required this.locationId,
    required this.paymentId,
    required this.restaurantId,
    required this.driverId,
    required this.paymentMethod,
    required this.total,
    required this.restaurantPrice,
    required this.deliveryFee,
    required this.driverPrice,
    required this.discount,
    required this.finalTotal,
    required this.status,
    required this.cancellationReason,
    required this.cancellationCustomReason,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final dynamic? userId;
  final dynamic? locationId;
  final dynamic? paymentId;
  final dynamic? restaurantId;
  final dynamic driverId;
  final dynamic? paymentMethod;
  final dynamic? total;
  final dynamic? restaurantPrice;
  final dynamic? deliveryFee;
  final dynamic? driverPrice;
  final dynamic? discount;
  final dynamic? finalTotal;
  final dynamic? status;
  final dynamic cancellationReason;
  final dynamic cancellationCustomReason;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final dynamic? id;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      userId: json["user_id"],
      locationId: json["location_id"],
      paymentId: json["payment_id"],
      restaurantId: json["restaurant_id"],
      driverId: json["driver_id"],
      paymentMethod: json["payment_method"],
      total: json["total"],
      restaurantPrice: json["restaurant_price"],
      deliveryFee: json["delivery_fee"],
      driverPrice: json["driver_price"],
      discount: json["discount"],
      finalTotal: json["final_total"],
      status: json["status"],
      cancellationReason: json["cancellation_reason"],
      cancellationCustomReason: json["cancellation_custom_reason"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
    );
  }

}
