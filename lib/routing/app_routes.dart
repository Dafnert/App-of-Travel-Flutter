import 'package:actividad3_flutter/pages/home_page.dart';
import 'package:actividad3_flutter/pages/login_page.dart';
import 'package:actividad3_flutter/pages/splash_page.dart';
import 'package:actividad3_flutter/routing/routes.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashPage(),
    Routes.login: (context) => const MyCustomForm(),
    Routes.home: (context) {
      final username = ModalRoute.of(context)!.settings.arguments as String;
      return HomePage(
      title:'Segunda pantalla',
      userName: username);
    },
  };
}
