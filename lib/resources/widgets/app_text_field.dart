import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tddmvvmflutter/resources/margin_keys.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String inputPlaceHolder;
  final TextEditingController controller;
  final TextInputType inputType;
  final VoidCallback onPressed;
  final bool isVisible;
  final FormFieldValidator validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextStyle? inputStyle;

  final FilteringTextInputFormatter whitelistingTextInputFormatter;

  const AppTextFieldWidget({
    super.key,
    required this.inputPlaceHolder,
    required this.controller,
    required this.inputType,
    required this.onPressed,
    required this.validator,
    required this.focusNode,
    required this.textInputAction,
    this.inputStyle,
    required this.whitelistingTextInputFormatter,
    this.isVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: MarginKeys.inputFieldVerticalMargin,
      ),
      child: TextFormField(
        key: key,
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        style: inputStyle,
        validator: validator,
        cursorColor: Theme.of(context).colorScheme.secondary,
        obscureText: isVisible,
        enableInteractiveSelection: true,
        autofocus: false,
        inputFormatters: [
          whitelistingTextInputFormatter,
        ],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.inputFiledRadius,
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.inputFiledRadius,
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.inputFiledRadius,
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.inputFiledRadius,
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.inputFiledRadius,
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          labelText: inputPlaceHolder,
          labelStyle: Theme.of(context).textTheme.headlineSmall,
        ),
        keyboardType: inputType,
        onTap: onPressed,
      ),
    );
  }
}
