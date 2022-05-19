import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationLocalizations {
  final Locale locale;
  late Map<String, String> _localizedStrings;
  static const LocalizationsDelegate<ApplicationLocalizations> delegate =
      _AppLocalizationsDelegate();

  ApplicationLocalizations(this.locale);

  static ApplicationLocalizations? of(BuildContext context) {
    return Localizations.of<ApplicationLocalizations>(
        context, ApplicationLocalizations);
  }

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String translate(String key) => _localizedStrings[key] ?? "";
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<ApplicationLocalizations> {
  static const List<String> supportedLanguages = ['en', 'pl'];

  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      supportedLanguages.contains(locale.languageCode);

  @override
  Future<ApplicationLocalizations> load(Locale locale) async {
    ApplicationLocalizations localizations = ApplicationLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
