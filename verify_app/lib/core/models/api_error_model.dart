// To parse this JSON data, do
//
//     final apiErrorModel = apiErrorModelFromJson(jsonString);

import 'dart:convert';

ApiErrorModel apiErrorModelFromJson(String str) =>
    ApiErrorModel.fromJson(json.decode(str));

String apiErrorModelToJson(ApiErrorModel data) => json.encode(data.toJson());

class ApiErrorModel {
  dynamic error;

  ApiErrorModel({
    this.error,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        error: json["error"] ?? json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
