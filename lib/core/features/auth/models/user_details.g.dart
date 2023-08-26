// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: json['id'] as int,
      fullName: json['full_name'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String? ?? '',
      gender: $enumDecodeNullable(_$GendersEnumMap, json['gender']),
      address: json['address'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      image: json['image'] as String,
      universityId: json['university_id'],
      isVerified: json['is_verified'] as bool,
    );

const _$GendersEnumMap = {
  Genders.male: 1,
  Genders.female: 0,
};
