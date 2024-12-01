class ResturantByCat {
  bool? success;
  String? message;
  dynamic? errors;
  List<Data>? data;

  ResturantByCat({this.success, this.message, this.errors, this.data});

  ResturantByCat.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
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
  dynamic? phoneNumbers;
  String? deliveryTime;
  String? crNumber;
  String? taxId;
  dynamic? licenceExpireDate;
  dynamic? legalEntityName;
  int? status;
  bool? isFavourite;
  int? orderCounts;
  String? createdAt;

  Data(
      {this.id,
        this.arName,
        this.enName,
        this.email,
        this.phone,
        this.photo,
        this.address,
        this.latitude,
        this.longitude,
        this.rate,
        this.phoneNumbers,
        this.deliveryTime,
        this.crNumber,
        this.taxId,
        this.licenceExpireDate,
        this.legalEntityName,
        this.status,
        this.isFavourite,
        this.orderCounts,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    rate = json['rate'];
    phoneNumbers = json['phone_numbers'];
    deliveryTime = json['delivery_time'];
    crNumber = json['cr_number'];
    taxId = json['tax_id'];
    licenceExpireDate = json['licence_expire_date'];
    legalEntityName = json['legal_entity_name'];
    status = json['status'];
    isFavourite = json['is_favourite'];
    orderCounts = json['order_counts'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ar_name'] = this.arName;
    data['en_name'] = this.enName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['rate'] = this.rate;
    data['phone_numbers'] = this.phoneNumbers;
    data['delivery_time'] = this.deliveryTime;
    data['cr_number'] = this.crNumber;
    data['tax_id'] = this.taxId;
    data['licence_expire_date'] = this.licenceExpireDate;
    data['legal_entity_name'] = this.legalEntityName;
    data['status'] = this.status;
    data['is_favourite'] = this.isFavourite;
    data['order_counts'] = this.orderCounts;
    data['created_at'] = this.createdAt;
    return data;
  }
}
