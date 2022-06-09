import '../../../src.dart';

abstract class TenantThemeEvent {
  const TenantThemeEvent();
}

class TenantThemeLoad extends TenantThemeEvent {
  const TenantThemeLoad({
    required this.colorScheme,
  });

  final CustomColorScheme colorScheme;
}

class TenantThemeToggle extends TenantThemeEvent {
  const TenantThemeToggle();
}
