import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/core/settings/settings.dart';
import 'package:projekt_pum/core/settings/settings.view.dart';
import 'package:projekt_pum/main.dart';
import 'package:projekt_pum/utils/helpers/locator.dart';
import 'package:projekt_pum/utils/services/local_storage.service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPageController extends State<SettingsPage>
    with TickerProviderStateMixin {
  SettingsPageController();

  final String language =
      locator<LocalStorageService>().get("language") ?? "system";
  final String theme = locator<LocalStorageService>().get("theme") ?? "system";

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  logout(){
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
  }

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
