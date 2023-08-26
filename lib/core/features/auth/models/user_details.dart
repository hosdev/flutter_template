import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_template/core/util/translator.dart';

part 'user_details.g.dart';



@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class UserDetails {


  factory UserDetails.fromJson(dynamic json) => _$UserDetailsFromJson(json);

  int id;
  @JsonKey(defaultValue: '')
  String fullName;
  @JsonKey(defaultValue: '')
  String mobile;
  @JsonKey(defaultValue: '')
  String email;
  Genders? gender;
  String? address;
  DateTime? createdAt;
  String image;
  dynamic universityId;
  bool isVerified;

  UserDetails({
    required this.id,
    required this.fullName,
    required this.mobile,
    required this.email,
    this.gender,
    this.address,
    this.createdAt,
    required this.image,
    required this.universityId,
    required this.isVerified,
  });
}

@JsonEnum(valueField: 'code')
enum Genders {
  male(1),
  female(0);

  const Genders(this.code);
  final int code;

  String  label(BuildContext context) {
    switch (this) {
      case Genders.female:
        return context.tr.female;
      case Genders.male:
        return context.tr.male;
    }
  }
}
