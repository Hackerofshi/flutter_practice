// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginbean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginbean _$LoginbeanFromJson(Map<String, dynamic> json) {
  return Loginbean()
    ..expire = json['expire'] as String
    ..mobile = json['mobile'] as String
    ..newPassword = json['newPassword'] as String
    ..password = json['password'] as String
    ..petName = json['petName'] as String
    ..token = json['token'] as String
    ..username = json['username'] as String;
}

Map<String, dynamic> _$LoginbeanToJson(Loginbean instance) => <String, dynamic>{
      'expire': instance.expire,
      'mobile': instance.mobile,
      'newPassword': instance.newPassword,
      'password': instance.password,
      'petName': instance.petName,
      'token': instance.token,
      'username': instance.username
    };
