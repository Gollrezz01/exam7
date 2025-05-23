// constants.dart

import 'package:flutter/material.dart';

/// Цвета приложения
class AppColors {
  static const primaryColor = Color(0xFF0066FF);        // Основной синий
  static const accentColor = Color(0xFFFFD700);         // Акцентный золотой
  static const backgroundColor = Color(0xFFF5F5F5);     // Светлый фон
  static const textColor = Color(0xFF333333);           // Цвет основного текста
  static const errorColor = Color(0xFFFF4C4C);          // Ошибки
  static const successColor = Color(0xFF4CAF50);        // Успешные действия
}

/// Размеры и отступы
class AppSizes {
  static const double padding = 16.0;
  static const double smallPadding = 8.0;
  static const double borderRadius = 12.0;
  static const double iconSize = 24.0;
  static const double buttonHeight = 48.0;
}

/// Статические строки
class AppStrings {
  static const appName = 'MyApp';
  static const defaultLocale = 'en';
  static const welcomeMessage = 'Welcome to MyApp!';
  static const loginButton = 'Login';
  static const registerButton = 'Register';
}

/// Текстовые стили (можно подключать через тему или напрямую)
class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );
}
