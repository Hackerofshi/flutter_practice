import 'package:json_annotation/json_annotation.dart';

part 'loginbean.g.dart';

@JsonSerializable()
class Loginbean {
    Loginbean();

    String expire;
    String mobile;
    String newPassword;
    String password;
    String petName;
    String token;
    String username;
    
    factory Loginbean.fromJson(Map<String,dynamic> json) => _$LoginbeanFromJson(json);
    Map<String, dynamic> toJson() => _$LoginbeanToJson(this);
}
