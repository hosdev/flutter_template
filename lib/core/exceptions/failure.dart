
class Failure {
  final String message;
  final dynamic data;
  final int code;

  Failure(this.message, this.data, this.code);

  @override
  String toString() {
    return message;
  }
}


