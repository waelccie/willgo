
class CheckOutModel {
  bool? success;
  String? message;
  List<dynamic>? errors;
  List<Data>? data;

  CheckOutModel({this.success, this.message, this.errors, this.data});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    errors = json["errors"] == null ? null : List<dynamic>.from(json["errors"]);
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    if(errors != null) {
      _data["errors"] = errors;
    }
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? userId;
  dynamic? locationId;
  int? paymentId;
  int? restaurantId;
  int? driverId;
  String? paymentMethod;
  int? total;
  int? deliveryFee;
  int? discount;
  int? finalTotal;
  String? status;
  String? cancellationReason;
  String? cancellationCustomReason;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data({this.userId, this.locationId, this.paymentId, this.restaurantId, this.driverId, this.paymentMethod, this.total, this.deliveryFee, this.discount, this.finalTotal, this.status, this.cancellationReason, this.cancellationCustomReason, this.updatedAt, this.createdAt, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    locationId = json["location_id"];
    paymentId = json["payment_id"];
    restaurantId = json["restaurant_id"];
    driverId = json["driver_id"];
    paymentMethod = json["payment_method"];
    total = json["total"];
    deliveryFee = json["delivery_fee"];
    discount = json["discount"];
    finalTotal = json["final_total"];
    status = json["status"];
    cancellationReason = json["cancellation_reason"];
    cancellationCustomReason = json["cancellation_custom_reason"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["location_id"] = locationId;
    _data["payment_id"] = paymentId;
    _data["restaurant_id"] = restaurantId;
    _data["driver_id"] = driverId;
    _data["payment_method"] = paymentMethod;
    _data["total"] = total;
    _data["delivery_fee"] = deliveryFee;
    _data["discount"] = discount;
    _data["final_total"] = finalTotal;
    _data["status"] = status;
    _data["cancellation_reason"] = cancellationReason;
    _data["cancellation_custom_reason"] = cancellationCustomReason;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}