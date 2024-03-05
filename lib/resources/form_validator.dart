import 'package:flutter/material.dart';
import 'package:tddmvvmflutter/resources/string_keys.dart';

import 'app_localizations.dart';

class FormValidator {
  BuildContext context;
  FormValidator(this.context);
  String? validateEmail(
    String? value,
  ) {
    final String input = value ?? '';
    if (input.trim().isEmpty) {
      return translate(
        context,
        StringKeys.invalidEmail,
      );
    }

    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(input)
        ? null
        : translate(
            context,
            StringKeys.invalidEmail,
          );
  }

  String? validateEntry(
    String? value,
  ) {
    final String input = value ?? '';
    if (input.trim().isEmpty || input.length < 4) {
      return translate(
        context,
        StringKeys.invalidEntery,
      );
    }
    return null;
  }
}
