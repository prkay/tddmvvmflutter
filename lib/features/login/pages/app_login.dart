import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruicomponent/widgets/app_text_field.dart';
import 'package:pruicomponent/widgets/progress_loader.dart';
import 'package:tddmvvmflutter/resources/margin_keys.dart';
import 'package:tddmvvmflutter/resources/string_keys.dart';
import 'package:tddmvvmflutter/resources/widget_keys.dart';

import '../../../injection/injection_container.dart';
import '../../../resources/app_localizations.dart';
import '../../../resources/form_validator.dart';
import '../../domain/usecases/login_param.dart';
import '../bloc/bloc.dart';

class AppLogin extends StatefulWidget {
  const AppLogin({
    super.key,
  });

  @override
  State<AppLogin> createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  late AppLoginBloc _appLoginBloc;
  late FormValidator formValidator;

  @override
  void initState() {
    _appLoginBloc = di<AppLoginBloc>();
    _appLoginBloc.add(
      AppLoginPageReadyEvent(),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    formValidator = FormValidator(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _appLoginBloc,
      child: BlocConsumer<AppLoginBloc, AppLoginState>(
        listener: (context, state) {
          if (state is AppLoginPageReadyState) {
            debugPrint(
              state.landingDone.toString(),
            );
          } else if (state is ApiFailureState) {
            var snackBar = SnackBar(
              content: Text(state.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is ApiSuccessState) {
            var snackBar = SnackBar(
              content: Text(
                  '${state.loginEntity.email} ${state.loginEntity.firstName} ${state.loginEntity.lastName}'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: ProgressLoader(
              inAsyncCall: state is LoadingState,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(
                    MarginKeys.bodyCommonVerticalMargin,
                  ),
                  child: Form(
                    key: _appLoginBloc.formKey,
                    child: Column(
                      children: [
                        Text(
                          translate(
                                context,
                                StringKeys.title,
                              ) ??
                              '',
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        AppTextFieldWidget(
                          key: WidgetKeys.loginPassword,
                          inputPlaceHolder: translate(
                                context,
                                StringKeys.email,
                              ) ??
                              '',
                          controller: _appLoginBloc.userNameController,
                          focusNode: _appLoginBloc.userNameFocus,
                          inputType: TextInputType.emailAddress,
                          inputStyle: Theme.of(context).textTheme.headlineSmall,
                          onPressed: () {},
                          validator: (value) {
                            return formValidator.validateEntry(value);
                          },
                          textInputAction: TextInputAction.done,
                          whitelistingTextInputFormatter:
                              FilteringTextInputFormatter.allow(
                                  RegExp('[^\\s]')),
                        ),
                        AppTextFieldWidget(
                          key: WidgetKeys.loginUsername,
                          inputPlaceHolder: translate(
                                context,
                                StringKeys.password,
                              ) ??
                              '',
                          controller: _appLoginBloc.passwordController,
                          focusNode: _appLoginBloc.passwordFocus,
                          inputType: TextInputType.text,
                          inputStyle: Theme.of(context).textTheme.headlineSmall,
                          onPressed: () {},
                          validator: (value) {
                            return formValidator.validateEntry(value);
                          },
                          textInputAction: TextInputAction.done,
                          whitelistingTextInputFormatter:
                              FilteringTextInputFormatter.allow(
                                  RegExp('[^\\s]')),
                        ),
                        InkWell(
                          child: const Text(
                            'LogIn',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onTap: () {
                            if (_appLoginBloc.formKey.currentState
                                    ?.validate() ??
                                false) {
                              _appLoginBloc.add(
                                UserLoginEvent(
                                  loginParam: LoginParam(
                                      username:
                                          _appLoginBloc.userNameController.text,
                                      password: _appLoginBloc
                                          .passwordController.text),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
