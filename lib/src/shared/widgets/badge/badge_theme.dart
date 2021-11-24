import 'package:flutter/material.dart';

import '../../../src.dart';

class BadgeTheme extends InheritedTheme {
  const BadgeTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final BadgeThemeData? data;

  static Widget merge({
    Key? key,
    required BadgeThemeData data,
    required Widget child,
  }) {
    return Builder(
      builder: (context) {
        return BadgeTheme(
          key: key,
          data: _getInheritedBadgeThemeData(context).merge(data),
          child: child,
        );
      },
    );
  }

  static BadgeThemeData of(
    BuildContext context,
  ) {
    return _getInheritedBadgeThemeData(context).resolve(context);
  }

  static BadgeThemeData _getInheritedBadgeThemeData(
    BuildContext context,
  ) {
    final scope = context.dependOnInheritedWidgetOfExactType<BadgeTheme>();
    return scope?.data ?? TenantTheme.of(context).badgeTheme;
  }

  @override
  bool updateShouldNotify(BadgeTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(
    BuildContext context,
    Widget child,
  ) {
    return BadgeTheme(
      data: data,
      child: child,
    );
  }
}
