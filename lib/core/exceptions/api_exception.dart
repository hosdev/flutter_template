import 'package:flutter_template/core/exceptions/failure.dart';

class FetchDataException extends Failure {
  FetchDataException(data) : super("Error During Communication ", data,0);
}

class BadRequestException extends Failure {
  BadRequestException(data) : super("Invalid Request ", data,1);
}

class UnauthorisedException extends Failure {
  UnauthorisedException(data) : super("Unauthorised ", data,2);
}

class InvalidInputException extends Failure {
  InvalidInputException(data) : super("Invalid ", data,3);
}

class ServerException extends Failure {
  ServerException(data) : super("Server Exception", data,4);
}

class InternetConnectionException extends Failure {
  InternetConnectionException() : super("No Internet connection", null,5);
}

