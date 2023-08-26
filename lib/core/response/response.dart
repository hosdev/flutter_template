import 'package:flutter_template/core/exceptions/failure.dart';

class AppResponse<T> {
  AppResponse({
    required this.status,
    this.message = "",
    this.statusCode = 0,
    T? data,
    Failure? error,
  })  : _data = data,
        _error = error;

  final ApiResStatus status;
  final T? _data;
  final Failure? _error;
  final String message;
  final int statusCode;

  T get data => _data!;
  Failure? get error => _error;

  @override
  String toString() {
    return "Status : $status \n Message : $message";
  }
}

enum ApiResStatus { loading, completed, error, empty }
