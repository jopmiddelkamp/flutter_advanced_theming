import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../src.dart';

class TenantTextThemeData extends Equatable {
  factory TenantTextThemeData({
    required TenantThemeColorScheme colorScheme,
    TextStyle? appBar,
  }) {
    return TenantTextThemeData._(
      pageTitleLight: appBar ??
          const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w700,
            fontFamily: "Recoleta",
            fontStyle: FontStyle.normal,
            fontSize: 24.0,
          ),
    );
  }

  const TenantTextThemeData._({
    required this.pageTitleLight,
  });

  final TextStyle pageTitleLight;

  TenantTextThemeData copyWith({
    TextStyle? appBar,
  }) {
    return TenantTextThemeData._(
      pageTitleLight: appBar ?? pageTitleLight,
    );
  }

  TenantTextThemeData resolve(BuildContext context) => this;

  @override
  List<Object?> get props => [
        pageTitleLight,
      ];
}
