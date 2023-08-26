import 'dart:convert';

class ForgetHelper{
  String email='';
  String password='';
  String crmUrl='';
  String code = '';
  String confirmPassword = '';
  String toJsonBody(){
    return jsonEncode({
      'email': email,
      'password': password,
    });
  }

}