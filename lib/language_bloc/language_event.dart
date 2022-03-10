part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}

class LanguageInitEvent extends LanguageEvent {}

///Событие выбора русского языка

class RussianLanguageEvent extends LanguageEvent {}

///Событие выбора английского языка

class EnglishLanguageEvent extends LanguageEvent {}
