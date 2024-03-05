import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';
import 'bloc.dart';

class AppLoginBloc extends Bloc<AppLoginEvent, AppLoginState> {
  final LoginUseCase loginUseCase;
  final TextEditingController userNameController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  AppLoginBloc({
    required this.loginUseCase,
  }) : super(
          const EmptyState(),
        ) {
    on<AppLoginPageReadyEvent>(
        (event, emit) => emit(const AppLoginPageReadyState(
              true,
            )));
    on<UserLoginEvent>(
      (event, emit) => emit(
        const LoadingState(),
      ),
    );
    on<ApiFailureEvent>(
      (event, emit) {
        emit(
          ApiFailureState(message: event.message),
        );
      },
    );
    on<ApiSuccessEvent>(
      (event, emit) {
        emit(ApiSuccessState(loginEntity: event.loginEntity));
      },
    );
  }

  @override
  Future<void> onEvent(AppLoginEvent event) async {
    super.onEvent(event);
    if (event is UserLoginEvent) {
      final result = await loginUseCase.call(
        event.loginParam,
      );
      result.fold((failure) {
        add(
          ApiFailureEvent(
            message: failure.commomFailureMessage,
          ),
        );
      }, (result) {
        add(
          ApiSuccessEvent(
            loginEntity: result,
          ),
        );
      });
    }
  }
}
