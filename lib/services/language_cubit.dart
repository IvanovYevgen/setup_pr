import 'dart:ui';

class LanguageHelper {
  static Locale englishLocale = const Locale('en', 'EN');
  static Locale russianLocale = const Locale('ru', 'RU');

  static Locale? setEnglishLocale(Locale ourLocale) {
    Locale? locale;
    if (ourLocale != englishLocale) {
      locale == englishLocale;
    }
    return locale;
  }

  static Locale? setRussianLocale(Locale ourLocale) {
    Locale? locale;
    if (ourLocale != russianLocale) {
      locale == russianLocale;
    }
    return locale;
  }
}







