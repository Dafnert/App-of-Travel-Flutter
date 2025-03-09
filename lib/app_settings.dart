import 'dart:ui' as ui;

/// Internationalization
/// Modifica esta variable para asociar la configuración dependiendo de la zona geográfica.
final defaultLocale = ui.window.locale.languageCode; // <-- (en, es_ES, en, es)
final defaultLanguage = ui.window.locale.countryCode; // <-- (en, es)

String get defaultDeviceLanguage {
  String defLocale = defaultLocale;
  if (defaultLanguage != null) {
    defLocale += '_$defaultLanguage'; 
  }
  return defLocale;
}