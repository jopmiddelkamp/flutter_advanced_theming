import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocProvider(
      create: (context) => TenantThemeBloc(),
      child: BlocBuilder<TenantThemeBloc, TenantThemeState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: buildTheme(state.tenantId),
            darkTheme: buildDarkTheme(state.tenantId),
            themeMode: state.themeMode,
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
