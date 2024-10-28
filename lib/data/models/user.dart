import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  final String username;
  final String email;
  final String password;

  User(
    this.username,
    this.email,
    this.password
  );

  
}