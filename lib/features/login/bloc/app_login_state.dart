import 'package:equatable/equatable.dart';

import '../../domain/entities/login_entity.dart';

abstract class AppLoginState extends Equatable {
  const AppLoginState();
}

class EmptyState extends AppLoginState {
  const EmptyState();
  @override
  List<Object> get props => [];
}

class AppLoginPageReadyState extends AppLoginState {
  final bool landingDone;

  const AppLoginPageReadyState(
    this.landingDone,
  );

  @override
  List<Object> get props => [
        landingDone,
      ];
}

class LoadingState extends AppLoginState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class ApiFailureState extends AppLoginState {
  final String message;

  const ApiFailureState({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}

class ApiSuccessState extends AppLoginState {
  final LoginEntity loginEntity;
  const ApiSuccessState({required this.loginEntity});
  @override
  List<Object> get props => [
        loginEntity,
      ];
}
