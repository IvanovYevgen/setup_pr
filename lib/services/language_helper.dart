import 'dart:ui';
import 'package:eyeglassapp/core/helpers/network_helper.dart';
import 'package:eyeglassapp/core/models/language.dart';
import 'package:eyeglassapp/core/preferences.dart';

class LanguageHelper {
  static const englishLang = 'English';
  static const russianLang = 'Русский';
  static Locale englishLocale = Locale('en', 'EN');
  static Locale russianLocale = Locale('ru', 'RU');
  static String prefLangKey = 'appLanguage';

  ///Возвращает текущую локаль из преференсов, если нет то дефолтную.
  static Locale getCurrentLocale() {
    final languageString = prefs.getString(prefLangKey);
    if (languageString != null) {
      return Locale(languageString, languageString.toUpperCase());
    }
    return englishLocale;

    /// TODO just change language
  }




