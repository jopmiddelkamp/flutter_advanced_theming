import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src.dart';

class TenantThemeBloc extends Bloc<TenantThemeEvent, TenantThemeState> {
  TenantThemeBloc()
      : super(
          const TenantThemeState(
            tenantId: 1,
            themeMode: ThemeMode.system,
          ),
        ) {
    on<SwitchTenant>((event, emit) async {
      emit(TenantThemeState(
        tenantId: event.tenantId,
        themeMode: state.themeMode,
      ));
    });
    on<SwitchThemeMode>((event, emit) async {
      emit(TenantThemeState(
        tenantId: state.tenantId,
        themeMode: event.themeMode,
      ));
    });
  }
}
