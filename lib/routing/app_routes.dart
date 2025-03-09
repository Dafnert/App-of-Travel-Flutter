
import 'package:actividad3_flutter/pages/compras_page.dart';
//import 'package:actividad3_flutter/pages/home_page.dart';
import 'package:actividad3_flutter/pages/login_page.dart';
import 'package:actividad3_flutter/pages/splash_page.dart';
import 'package:actividad3_flutter/routing/routes.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashPage(),
    Routes.login: (context) => const MyCustomForm(),
    Routes.shopping: (context) {
      final username = ModalRoute.of(context)!.settings.arguments as String;
      return ComprasPage(
      //title:'Segunda pantalla',
      userName: username);
    },
  };
}
