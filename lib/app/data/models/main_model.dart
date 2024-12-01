class MainModel {
  bool? success;
  String? message;
  List<String>? errors;

  MainModel({this.success, this.message, this.errors});

  MainModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["errors"] is List) {
      errors =
          json["errors"] == null ? null : List<String>.from(json["errors"]);
    }
  }

  static List<MainModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MainModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    if (errors != null) {
      _data["errors"] = errors;
    }
    return _data;
  }

  MainModel copyWith({
    bool? success,
    String? message,
    List<String>? errors,
  }) =>
      MainModel(
        success: success ?? this.success,
        message: message ?? this.message,
        errors: errors ?? this.errors,
      );
}
