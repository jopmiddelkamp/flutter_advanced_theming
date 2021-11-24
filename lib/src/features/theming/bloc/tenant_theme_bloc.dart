import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src.dart';

class TenantThemeBloc extends Bloc<TenantThemeEvent, TenantThemeState> {
  TenantThemeBloc()
      : super(
          TenantThemeState(
            colorScheme: LightThemeColorScheme(),
          ),
        ) {
    on<TenantThemeToggle>((event, emit) async {
      final colorScheme = state.colorScheme == LightThemeColorScheme()
          ? DarkThemeColorScheme()
          : LightThemeColorScheme();

      emit(TenantThemeState(
        colorScheme: colorScheme,
      ));
    });
  }
}
