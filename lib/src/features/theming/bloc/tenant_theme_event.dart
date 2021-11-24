import '../../../src.dart';

abstract class TenantThemeEvent {
  const TenantThemeEvent();
}

class TenantThemeLoad extends TenantThemeEvent {
  const TenantThemeLoad({
    required this.colorScheme,
  });

  final TenantThemeColorScheme colorScheme;
}

class TenantThemeToggle extends TenantThemeEvent {
  const TenantThemeToggle();
}
