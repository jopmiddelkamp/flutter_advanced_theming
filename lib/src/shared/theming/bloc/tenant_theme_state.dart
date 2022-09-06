import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TenantThemeState extends Equatable {
  const TenantThemeState({
    required this.tenantId,
    required this.themeMode,
  });

  final int tenantId;
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [
        tenantId,
        themeMode,
      ];
}
