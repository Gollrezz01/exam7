// extension.dart

import 'package:flutter/material.dart';

/// Расширения для [BuildContext]
extension ContextExtensions on BuildContext {
  /// Быстрый доступ к ширине экрана
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Быстрый доступ к высоте экрана
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Быстрый доступ к отступам (например: context.paddingAll)
  EdgeInsets get paddingAll => const EdgeInsets.all(16);

  /// Быстрый доступ к теме
  ThemeData get theme => Theme.of(this);

  /// Быстрый доступ к цветовому оформлению
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Быстрый доступ к навигации
  NavigatorState get navigator => Navigator.of(this);
}

/// Расширения для [String]
extension StringExtensions on String {
  /// Заглавная первая буква
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Проверка email
  bool get isValidEmail => RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(this);

  /// Преобразование строки в int безопасно
  int toInt({int defaultValue = 0}) => int.tryParse(this) ?? defaultValue;
}

/// Расширения для [Widget] — добавление паддингов и выравнивания
extension WidgetModifiers on Widget {
  /// Обернуть виджет в [Padding]
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  /// Обернуть в центрирование
  Widget center() => Center(child: this);

  /// Обернуть в [Expanded]
  Widget expanded() => Expanded(child: this);
}
