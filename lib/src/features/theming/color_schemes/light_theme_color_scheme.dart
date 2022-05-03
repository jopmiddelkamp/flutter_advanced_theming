import 'package:flutter/material.dart';

import '../../../src.dart';

class LightThemeColorScheme extends TenantThemeColorScheme {
  LightThemeColorScheme()
      : super(
          brightness: Brightness.light,
          primary: const Color.fromRGBO(0, 135, 0, 1),
          onPrimary: const Color.fromRGBO(255, 255, 255, 1),
          secondary: const Color.fromARGB(255, 152, 0, 1),
          onSecondary: const Color.fromRGBO(255, 255, 255, 1),
          background: const Color.fromRGBO(255, 255, 255, 1),
          onBackground: const Color.fromRGBO(55, 55, 55, 1),
          surface: const Color.fromRGBO(255, 255, 255, 1),
          onSurface: const Color.fromRGBO(55, 55, 55, 1),
          error: const Color.fromRGBO(237, 109, 73, 1),
          onError: const Color.fromRGBO(255, 255, 255, 1),
          primaryDarker: const Color.fromRGBO(0, 100, 0, 1),
          primaryDarkest: const Color.fromRGBO(0, 65, 0, 1),
          backgroundDarker: const Color.fromRGBO(246, 246, 246, 1),
          onSurfaceLighter: const Color.fromRGBO(182, 182, 182, 1),
          border: const Color.fromRGBO(235, 235, 235, 1),
          divider: const Color.fromRGBO(235, 235, 235, 1),
          severe: const Color.fromRGBO(237, 109, 73, 1),
          onSevere: const Color.fromRGBO(255, 255, 255, 1),
          warning: const Color.fromRGBO(255, 194, 56, 1),
          onWarning: const Color.fromRGBO(255, 255, 255, 1),
          success: const Color.fromRGBO(93, 215, 132, 1),
          onSuccess: const Color.fromRGBO(255, 255, 255, 1),
          info: const Color.fromRGBO(182, 182, 182, 1),
          onInfo: const Color.fromRGBO(255, 255, 255, 1),
          badge: const Color.fromARGB(255, 152, 0, 1),
          onBadge: const Color.fromRGBO(255, 255, 255, 1),
        );
}
