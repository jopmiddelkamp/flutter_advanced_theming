import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocProvider(
      create: (context) => TenantThemeBloc(),
      child: BlocBuilder<TenantThemeBloc, TenantThemeState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final tenantTheme = TenantThemeData(
            colorScheme: state.colorScheme,
          );
          return TenantTheme(
            data: tenantTheme,
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: tenantTheme.materialTheme,
              home: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
