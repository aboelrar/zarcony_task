import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationLocalizations {
  final Locale? appLocale;

  Map<String, String>? _localizedStrings = {};

  ApplicationLocalizations(this.appLocale);

  static ApplicationLocalizations? of(BuildContext context) {
    return Localizations.of<ApplicationLocalizations>(context, ApplicationLocalizations);
  }

  Future<bool> load() async {
    // Load JSON file from the "language" folder
    String jsonString =
    await rootBundle.loadString('assets/locale/${appLocale!.languageCode}.json');
    Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);

    _localizedStrings = jsonLanguageMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // called from every widget which needs a localized text
  String? translate(String jsonkey) {
    return _localizedStrings![jsonkey];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<ApplicationLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<ApplicationLocalizations> load(Locale locale) async {
    ApplicationLocalizations applicationLocalizations = ApplicationLocalizations(locale);
    await applicationLocalizations.load();
    return applicationLocalizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;
}