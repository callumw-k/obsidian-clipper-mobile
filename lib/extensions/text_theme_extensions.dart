import 'package:flutter/material.dart';

enum FontSize { small, medium, large }

extension TextThemeExtensions on BuildContext {
  TextStyle? fontSize(FontSize size) {
    final theme = Theme.of(this).textTheme;
    switch (size) {
      case FontSize.small:
        return theme.bodySmall;
      case FontSize.medium:
        return theme.bodyMedium;
      case FontSize.large:
        return theme.headlineLarge;
    }
  }
}
