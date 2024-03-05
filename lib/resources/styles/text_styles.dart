import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

TextTheme appTextTheme(BuildContext context) => Theme.of(context).textTheme;

TextTheme get appTextStyleTheme => const TextTheme(
      // Title : headline1
      headlineLarge: TextStyle(
        fontSize: 28,
        color: AppColors.inputTextColor,
      ),
      // Display1 : headline2
      headlineMedium: TextStyle(
        fontSize: 22,
        color: AppColors.inputTextColor,
      ),
      // SubTitle : headline3
      headlineSmall: TextStyle(
        fontSize: 20,
        color: AppColors.inputTextColor,
      ),
    );

abstract class TextStyles {
  // No match found for below text styles in Global styleguide
}
