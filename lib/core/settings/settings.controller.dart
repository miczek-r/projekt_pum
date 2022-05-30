import 'package:flutter/material.dart';
import 'package:projekt_pum/core/settings/settings.dart';
import 'package:projekt_pum/core/settings/settings.view.dart';
import 'package:projekt_pum/core/verify-code/verify-code.dart';
import 'package:projekt_pum/main.dart';
import 'package:projekt_pum/utils/helpers/locator.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/services/local_storage.service.dart';

enum Status { Waiting, Error }

class SettingsPageController extends State<SettingsPage>
    with TickerProviderStateMixin {
  SettingsPageController();

  changeLanguage(String? language) {
    if (language == "system") {
      locator<LocalStorageService>().remove("language");
    }
    locator<LocalStorageService>().set('language', language);
    MyApp.update(context);
  }

  changeTheme(String? theme) {
    if (theme == "system") {
      locator<LocalStorageService>().remove("theme");
    }
    locator<LocalStorageService>().set('theme', theme);
    MyApp.update(context);
  }

  @override
  Widget build(BuildContext context) => SettingsPageView(this);
}
