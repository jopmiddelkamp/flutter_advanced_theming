import 'package:flutter/material.dart';

import '../../../src.dart';

class PillTheme extends InheritedTheme {
  const PillTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final PillThemeData? data;

  static Widget merge({
    Key? key,
    required PillThemeData data,
    required Widget child,
  }) {
    return Builder(
      builder: (context) {
        return PillTheme(
          key: key,
          data: _getInheritedPillThemeData(context).merge(data),
          child: child,
        );
      },
    );
  }

  static PillThemeData of(
    BuildContext context,
  ) {
    return _getInheritedPillThemeData(context).resolve(context);
  }

  static PillThemeData _getInheritedPillThemeData(
    BuildContext context,
  ) {
    final scope = context.dependOnInheritedWidgetOfExactType<PillTheme>();
    return scope?.data ?? TenantTheme.of(context).pillTheme;
  }

  @override
  bool updateShouldNotify(PillTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(
    BuildContext context,
    Widget child,
  ) {
    return PillTheme(
      data: data,
      child: child,
    );
  }
}
