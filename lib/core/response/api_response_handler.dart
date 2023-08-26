import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_template/core/exceptions/api_exception.dart';
import 'package:flutter_template/core/exceptions/failure.dart';
import 'package:flutter_template/core/response/response.dart';

class ApiResponseHandler<T> {
  final http.Response response;
  T Function(dynamic mapData) fromJson;
  ApiResponseHandler({required this.response, required this.fromJson});

  //ToDO: Add handle response
  AppResponse<T> handleResponse() {
    if (response.statusCode.toString().startsWith('2')) {
      final data = json.decode(response.body.toString());
      final message = data[messageKey] ?? "Success";
      return AppResponse<T>(
          status: ApiResStatus.completed,
          data: fromJson(data[dataKey]),
          message : message,
          statusCode: 200);
    }

    final err = errorByStatus();
    final errApiMessage = (err).data[errorKey]?.toString();
    final errType = (err).message;
    return AppResponse<T>(
        status: ApiResStatus.error,
        message: "${err.code}: $errApiMessage",
        error: err,
        statusCode: err.code);
  }

  Failure errorByStatus() {
    dynamic data;
    try {
      data = json.decode(response.body.toString());
    } catch (e) {
      data = {};
    }
    switch (response.statusCode) {
      case 400:
        return BadRequestException(data);
      case 401:
        return UnauthorisedException(data);
      case 403:
        return UnauthorisedException(data);
      case 404:
        return InvalidInputException(data);
      case 422:
        return InvalidInputException(data);
      case 500:
        return ServerException(data);
      default:
        return FetchDataException(data);
    }
  }

  static const messageKey = 'message';
  static const errorKey = 'errors';
  static const dataKey = 'data';
  static const statusKey = 'status';
}
