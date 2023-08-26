
import 'package:flutter_template/core/services/notifications.dart';

class LoginParams{
  String email='';
  String password='';

  Future<Map<String, String>> toJsonBody()async{
    return {
      'email': email,
      'password': password,
      'fcm': await FCM.getToken(),
    };
  }

}