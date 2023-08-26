import 'package:flutter_template/core/features/auth/models/user_details.dart';

class RegisterParams {
  String email = '';
  String name = '';
  String phone = '';
  Genders? gender;
  String password = '';
  String passwordRepeated = '';


  Future<Map<String, String>> toJsonBody(String lang,String fcm) async {
    var map = <String, String>{};
    map.addAll({
      'email': email,
      'mobile': phone,
      'password': password,
      'name': name,
      'password_confirmation': passwordRepeated,
      'fcm': fcm,
      'lang': lang,
    });
    return map;
  }

}
