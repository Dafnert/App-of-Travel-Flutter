import 'package:actividad3_flutter/app_settings.dart';
import 'package:actividad3_flutter/routing/app_routes.dart';
import 'package:actividad3_flutter/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';

void main() {
  Intl.defaultLocale =
      defaultDeviceLanguage; 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State {
  late Locale _locale;
  Locale get locale => _locale;

  final _supportedLocales = const [
    Locale('es'),
    Locale('en'),
    Locale('es_ES'),
    Locale('en_US'),
    Locale('ca'),
    Locale('ca_CAT')
  ];
  @override
  void initState() {
    super.initState();
    _locale = Locale(defaultLocale, defaultLanguage);
  }

  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: _supportedLocales,
      locale: _locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      initialRoute: Routes.splash,
    );
  }
}

//Dropdown language
List<Widget> languageSelector(BuildContext context) {
  final appState = context.findAncestorStateOfType<MainState>();
  return [
    DropdownButton(
      value: appState?.locale,
      icon: const Icon(Icons.language),
      items: const [
        DropdownMenuItem(
          value: Locale('en', 'US'),
          child: Text("English"),
        ), // DropdownMenuItem
        DropdownMenuItem(
          value: Locale('es', 'ES'),
          child: Text("Español"),
        ), // DropdownMenuItem
        DropdownMenuItem(
          value: Locale('ca', 'CAT'),
          child: Text("Catalán"),
        ),
      ],
      // Este callback permite cambiar el idioma de la aplicación, mediante
      // el método changeLanguage.
      onChanged: (locale) {
        if (locale != null) {
          appState?.changeLanguage(locale);
        }
      },
    ), // DropdownButton
  ];
}


