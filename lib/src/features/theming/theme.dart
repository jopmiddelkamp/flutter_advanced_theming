import 'package:flutter/material.dart';

import '../../src.dart';

ThemeData buildTheme(
  CustomColorScheme colorScheme,
) {
  final textTheme = CustomTextTheme(
    colorScheme: colorScheme,
  );
  final theme = ThemeData.from(
    colorScheme: colorScheme.materialColorScheme,
  );

  return theme.copyWith(extensions: [
    colorScheme,
    textTheme,
    CustomTheme(
      colorScheme: colorScheme,
      textTheme: textTheme,
    ),
  ]);
}
