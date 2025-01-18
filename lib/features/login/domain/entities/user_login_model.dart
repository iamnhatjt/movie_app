// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'user_login_model.g.dart';

@JsonSerializable()
class UserLoginModel {
  String email;
  String password;
  UserLoginModel({
    required this.email,
    required this.password,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginModelToJson(this);
}
