import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../src.dart';

class TenantTextThemeData extends Equatable {
  factory TenantTextThemeData({
    required TenantThemeColorScheme colorScheme,
    TextStyle? appBar,
  }) {
    return TenantTextThemeData._(
      appBar: appBar ??
          TextStyle(
            color: colorScheme.onPrimary,
            fontSize: 33.0,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  const TenantTextThemeData._({
    required this.appBar,
  });

  final TextStyle appBar;

  TenantTextThemeData copyWith({
    TextStyle? appBar,
  }) {
    return TenantTextThemeData._(
      appBar: appBar ?? this.appBar,
    );
  }

  TenantTextThemeData resolve(BuildContext context) => this;

  @override
  List<Object?> get props => [
        appBar,
      ];
}
