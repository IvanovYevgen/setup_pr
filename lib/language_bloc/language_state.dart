part of 'language_bloc.dart';

///Состояние языка
@immutable
abstract class LanguageState extends Equatable {
  final Locale locale;

  const LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}

class LanguageInitial extends LanguageState {
  const LanguageInitial({required Locale locale}) : super(locale);
}

class RussianLanguageState extends LanguageState {
  const RussianLanguageState({required Locale locale}) : super(locale);
}

class EnglishLanguageState extends LanguageState {
  const EnglishLanguageState({required Locale locale}) : super(locale);
}
