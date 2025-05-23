import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true, // если ты используешь Material 3
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: AppTextStyles.headline.copyWith(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    primary: AppColors.primaryColor,
    secondary: AppColors.accentColor,
    surface: AppColors.backgroundColor, // заменили deprecated background на surface
    error: AppColors.errorColor,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    displayLarge: AppTextStyles.headline,
    bodyMedium: AppTextStyles.body,
    bodySmall: AppTextStyles.caption,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.all(AppSizes.padding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      borderSide: BorderSide(
          color: AppColors.primaryColor.withAlpha((0.5 * 255).round())), // вместо withOpacity
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
    ),
  ),
);
