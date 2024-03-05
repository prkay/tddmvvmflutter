import '../../domain/entities/login_entity.dart';

/// Login Response Model
class LoginModel extends LoginEntity {
  const LoginModel({
    required super.id,
    required super.email,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.gender,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"]);
  }
}
