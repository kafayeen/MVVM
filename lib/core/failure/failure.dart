import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure {
  final String error;
  Failure({required this.error});
}

class ServiceFailure extends Failure {
  ServiceFailure({required super.error});
  factory ServiceFailure.fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure(error: "the connection Time Out");
      case DioExceptionType.badResponse:
        return ServiceFailure.fromJson(
            e.response?.statusCode!, e.response!.data);
      case DioExceptionType.badCertificate:
        return ServiceFailure(error: "bad Certificate");
      case DioExceptionType.connectionError:
        return ServiceFailure(error: "connectionError");
      case DioExceptionType.sendTimeout:
        return ServiceFailure(error: "sendTimeout");
      case DioExceptionType.unknown:
        return ServiceFailure(error: "unknown");
      case DioExceptionType.receiveTimeout:
        return ServiceFailure(error: "receiveTimeout");
      case DioExceptionType.cancel:
        return ServiceFailure(error: "cancel");
      default:
        return ServiceFailure(error: "error not found");
    }
  }
  factory ServiceFailure.fromJson(int? statusCode, Map<String, dynamic> json) {
    if (statusCode == 400 ||
        statusCode == 200 ||
        statusCode == 401 ||
        statusCode == 402) {
      return ServiceFailure(error: json["error"]["msg"]);
    } else {
      log("$statusCode");
      return ServiceFailure(error: "error not found");
    }
  }
}
