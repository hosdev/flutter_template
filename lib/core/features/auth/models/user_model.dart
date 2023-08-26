  import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_template/core/features/auth/models/user_details.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });

  factory UserModel.fromJson(dynamic json) => _$UserModelFromJson(json);

  @JsonKey(fromJson: UserDetails.fromJson)
  UserDetails user;
  @JsonKey(name: 'token')
  String token;
}
