import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_project/services/language_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';

part 'language_state.dart';

///Класс Bloc, регулирующий переключение языков по выбору пользователя
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageInitial(locale: LanguageHelper.getCurrentLocale()));

  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is EnglishLanguageEvent) {
      try {
        //      myVariable=await LanguageHelper.setLanguage;
        await LanguageHelper.setLanguage('en');
        await LanguageHelper.saveLocalLangCode('en');
        yield EnglishLanguageState(locale: LanguageHelper.englishLocale);
        return;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    if (event is RussianLanguageEvent) {
      try {
        await LanguageHelper.setLanguage('ru');
        await LanguageHelper.saveLocalLangCode('ru');
        yield RussianLanguageState(locale: LanguageHelper.russianLocale);
        return;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
