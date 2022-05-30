import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projekt_pum/config/routes/routes.dart';
import 'package:projekt_pum/config/themes/dark_theme.dart';
import 'package:projekt_pum/config/themes/light_theme.dart';
import 'package:projekt_pum/utils/helpers/locator.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/services/environment.service.dart';
import 'package:projekt_pum/utils/services/local_storage.service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  const String environment =
      String.fromEnvironment('ENVIRONMENT', defaultValue: Environment.DEV);
  Environment().initConfig(environment);
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void update(BuildContext context) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.update();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const localizationsDelegates = [
    ApplicationLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('pl', 'PL')
  ];

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      localeResolutionCallback: _localeResolutionCallback,
      locale: locator<LocalStorageService>().contains('language')
          ? Locale(locator<LocalStorageService>().get('language'), '')
          : null,
      routes: customRoutes,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: (locator<LocalStorageService>().contains('theme'))
          ? locator<LocalStorageService>().get('theme') == 'dark'
              ? ThemeMode.dark
              : ThemeMode.light
          : ThemeMode.system,
    );
  }

  Locale _localeResolutionCallback(locale, Iterable<Locale> supportedLocales) {
    Locale? language;
    if (locator<LocalStorageService>().contains('language')) {
      var languageString = locator<LocalStorageService>().get('language');
      language = supportedLocales.singleWhere(
          (element) => element.languageCode == languageString,
          orElse: () => null as Locale);
    }
    return language ??
        supportedLocales.singleWhere(
            (element) => element.languageCode == locale!.languageCode,
            orElse: () => supportedLocales.first);
  }
}
