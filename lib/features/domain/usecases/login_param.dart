import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginParam extends Equatable {
  final String username;
  final String password;

  const LoginParam({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [
        username,
        password,
      ];
  String toMap() {
    return json.encode({
      "username": username,
      "password": password,
    });
  }
}
