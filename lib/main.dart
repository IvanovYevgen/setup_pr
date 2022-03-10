import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template_project/flavour_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template_project/language_bloc/language_cubit.dart';
import 'package:logger/logger.dart';

Future initializeApp() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, lang) {
          return MaterialApp(
            locale: lang,
            title: 'Flutter Demo',
            localizationsDelegates: const [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('ru', ''),
            ],
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  var logger = Logger();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _log() {
    logger.d('Log message with 2 methods');
    logger.i('Info message');
    logger.w('Just a warning!');
    logger.e('Error! Something bad happened', 'Test Error');
    logger.v({'key': 5, 'value': 'something'});
    Logger(printer: SimplePrinter(colors: true)).v('boom');
  }

  @override
  Widget build(BuildContext context) {
    final Locale appLocale = Localizations.localeOf(context);

    final flavour = Constants.whereAmI;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: flavour.getFlavourColor(),
        title: Text(
          'You are running ${flavour.getFlavourName()} App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context)!.title),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),

            const Divider(),
            TextButton(
              onPressed: () {
                context.read<LanguageCubit>().setEnglishLocale(appLocale);
              },
              child: const Text('English'),
            ),
            TextButton(
              onPressed: () {
                context.read<LanguageCubit>().setRussianLocale(appLocale);
              },
              child: const Text('Russian'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          _log();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
