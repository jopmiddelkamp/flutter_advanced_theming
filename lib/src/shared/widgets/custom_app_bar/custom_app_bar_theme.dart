import 'package:flutter/material.dart';

import '../../../src.dart';

class CustomAppBarTheme extends InheritedTheme {
  const CustomAppBarTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final CustomAppBarThemeData? data;

  static Widget merge({
    Key? key,
    required CustomAppBarThemeData data,
    required Widget child,
  }) {
    return Builder(
      builder: (context) {
        return CustomAppBarTheme(
          key: key,
          data: _getInheritedCustomAppBarThemeData(context).merge(data),
          child: child,
        );
      },
    );
  }

  static CustomAppBarThemeData of(
    BuildContext context,
  ) {
    return _getInheritedCustomAppBarThemeData(context).resolve(context);
  }

  static CustomAppBarThemeData _getInheritedCustomAppBarThemeData(
    BuildContext context,
  ) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<CustomAppBarTheme>();
    return scope?.data ?? TenantTheme.of(context).appBarTheme;
  }

  @override
  bool updateShouldNotify(CustomAppBarTheme oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(
    BuildContext context,
    Widget child,
  ) {
    return CustomAppBarTheme(
      data: data,
      child: child,
    );
  }
}
