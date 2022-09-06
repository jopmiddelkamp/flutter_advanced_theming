import 'package:flutter/material.dart';

abstract class TenantThemeEvent {
  const TenantThemeEvent();
}

class SwitchTenant extends TenantThemeEvent {
  const SwitchTenant(this.tenantId);

  final int tenantId;
}

class SwitchThemeMode extends TenantThemeEvent {
  const SwitchThemeMode(this.themeMode);

  final ThemeMode themeMode;
}
