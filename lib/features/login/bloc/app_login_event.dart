import 'package:equatable/equatable.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/usecases/login_param.dart';

abstract class AppLoginEvent extends Equatable {
  const AppLoginEvent();
}

class AppLoginPageReadyEvent extends AppLoginEvent {
  @override
  List<Object> get props => [];
}

class UserLoginEvent extends AppLoginEvent {
  final LoginParam loginParam;

  const UserLoginEvent({
    required this.loginParam,
  });
  @override
  List<Object> get props => [
        loginParam,
      ];
}

class ApiFailureEvent extends AppLoginEvent {
  final String message;

  const ApiFailureEvent({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}

class ApiSuccessEvent extends AppLoginEvent {
  final LoginEntity loginEntity;
  const ApiSuccessEvent({
    required this.loginEntity,
  });
  @override
  List<Object> get props => [
        loginEntity,
      ];
}
