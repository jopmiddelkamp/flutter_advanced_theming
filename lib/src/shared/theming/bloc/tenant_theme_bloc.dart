import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src.dart';

class TenantThemeBloc extends Bloc<TenantThemeEvent, TenantThemeState> {
  TenantThemeBloc()
      : super(
          TenantThemeState(
            colorScheme: lightColorScheme,
          ),
        ) {
    on<TenantThemeToggle>((event, emit) async {
      final colorScheme = state.colorScheme == lightColorScheme
          ? darkColorScheme
          : lightColorScheme;

      emit(TenantThemeState(
        colorScheme: colorScheme,
      ));
    });
  }
}
