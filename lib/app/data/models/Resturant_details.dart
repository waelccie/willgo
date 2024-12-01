
class ResturantDetailsModel {
  bool? success;
  String? message;
  List<dynamic>? errors;
  Data? data;

  ResturantDetailsModel({this.success, this.message, this.errors, this.data});

  ResturantDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    errors = json["errors"] == null ? null : List<dynamic>.from(json["errors"]);
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    if(errors != null) {
      _data["errors"] = errors;
    }
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? arName;
  String? enName;
  String? email;
  String? phone;
  String? photo;
  String? address;
  String? latitude;
  String? longitude;
  int? rate;
  List<String>? phoneNumbers;
  String? deliveryTime;
  String? crNumber;
  String? taxId;
  String? licenceExpireDate;
  String? legalEntityName;
  int? status;
  bool? isFavourite;
  int? orderCounts;
  String? createdAt;

  Data({this.id, this.arName, this.enName, this.email, this.phone, this.photo, this.address, this.latitude, this.longitude, this.rate, this.phoneNumbers, this.deliveryTime, this.crNumber, this.taxId, this.licenceExpireDate, this.legalEntityName, this.status, this.isFavourite, this.orderCounts, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    arName = json["ar_name"];
    enName = json["en_name"];
    email = json["email"];
    phone = json["phone"];
    photo = json["photo"];
    address = json["address"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    rate = json["rate"];
    phoneNumbers = json["phone_numbers"] == null ? null : List<String>.from(json["phone_numbers"]);
    deliveryTime = json["delivery_time"];
    crNumber = json["cr_number"];
    taxId = json["tax_id"];
    licenceExpireDate = json["licence_expire_date"];
    legalEntityName = json["legal_entity_name"];
    status = json["status"];
    isFavourite = json["is_favourite"];
    orderCounts = json["order_counts"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["ar_name"] = arName;
    _data["en_name"] = enName;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["photo"] = photo;
    _data["address"] = address;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["rate"] = rate;
    if(phoneNumbers != null) {
      _data["phone_numbers"] = phoneNumbers;
    }
    _data["delivery_time"] = deliveryTime;
    _data["cr_number"] = crNumber;
    _data["tax_id"] = taxId;
    _data["licence_expire_date"] = licenceExpireDate;
    _data["legal_entity_name"] = legalEntityName;
    _data["status"] = status;
    _data["is_favourite"] = isFavourite;
    _data["order_counts"] = orderCounts;
    _data["created_at"] = createdAt;
    return _data;
  }
}