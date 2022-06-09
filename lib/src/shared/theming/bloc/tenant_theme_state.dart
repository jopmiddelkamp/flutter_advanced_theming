import 'package:equatable/equatable.dart';

import '../../../src.dart';

class TenantThemeState extends Equatable {
  const TenantThemeState({
    required this.colorScheme,
  });

  final CustomColorScheme colorScheme;

  @override
  List<Object?> get props => [
        colorScheme,
      ];
}
