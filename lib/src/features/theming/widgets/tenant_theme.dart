import 'package:flutter/material.dart';

import '../../../src.dart';

const kDefaultAnimationDuration = Duration(milliseconds: 300);

class TenantTheme extends InheritedTheme {
  const TenantTheme({
    this.data,
    required Widget child,
    Key? key,
  }) : super(
          key: key,
          child: child,
        );

  final TenantThemeData? data;

  static TenantThemeData of(
    BuildContext context,
  ) {
    return _getInheritedTenantThemeData(context).resolve(context).copyWith(
          // Otherwise the theme will run out of sync. Need to find out why?..
          materialTheme: Theme.of(context),
        );
  }

  static TenantThemeData _getInheritedTenantThemeData(
    BuildContext context,
  ) {
    final scope = context.dependOnInheritedWidgetOfExactType<TenantTheme>();
    return scope?.data ?? TenantThemeData();
  }

  @override
  bool updateShouldNotify(TenantTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(
    BuildContext context,
    Widget child,
  ) {
    return TenantTheme(
      data: data,
      child: child,
    );
  }
}
