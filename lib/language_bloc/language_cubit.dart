import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en', 'EN'));

  final Locale englishLocale = const Locale('en', 'EN');
  final Locale russianLocale = const Locale('ru', 'RU');

  Locale? setEnglishLocale(Locale ourLocale) {
    Locale? locale;
    if (ourLocale != englishLocale) {
      emit(englishLocale);
    }
    return locale;
  }

  Locale? setRussianLocale(Locale ourLocale) {
    Locale? locale;
    if (ourLocale != russianLocale) {
      emit(russianLocale);
    }
    return locale;
  }
}
