import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class Themes {
  static final appTheme = ThemeData(
    primaryColor: AppColors.burgundy,
    scaffoldBackgroundColor: AppColors.lightGrey,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.orangeWeb),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.burgundy),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.orangeWeb),
  );
}
