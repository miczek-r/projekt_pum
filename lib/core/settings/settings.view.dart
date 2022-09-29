import 'package:flutter/material.dart';
import 'package:projekt_pum/core/settings/settings.controller.dart';
import 'package:projekt_pum/core/settings/settings.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_button/glass_button.dart';
import 'package:projekt_pum/utils/ui/glass_container/glass_container.dart';
import 'package:widget_view/widget_view.dart';

class SettingsPageView
    extends StatefulWidgetView<SettingsPage, SettingsPageController> {
  const SettingsPageView(SettingsPageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Center(
                child: Text(
              ApplicationLocalizations.of(context)!.translate("settings"),
              style: TextStyle(color: Colors.white, fontSize: 40),
            )),
          ),
          Expanded(
            child: GlassContainer(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(ApplicationLocalizations.of(context)!
                        .translate("language")),
                    DropdownButtonFormField(
                        isExpanded: true,
                        value: controller.language,
                        items: ([
                          "system",
                          ...ApplicationLocalizations.of(context)!
                              .getSupportedLanguages()
                        ])
                            .map((String language) => DropdownMenuItem(
                                value: language,
                                child: Center(
                                  child: Text(
                                      ApplicationLocalizations.of(context)!
                                          .translate(language)),
                                )))
                            .toList(),
                        onChanged: (String? newLanguage) =>
                            controller.changeLanguage(newLanguage)),
                    Text(ApplicationLocalizations.of(context)!
                        .translate("theme")),
                    DropdownButtonFormField(
                        isExpanded: true,
                        value: controller.theme,
                        items: (["system", "dark", "light"])
                            .map((String theme) => DropdownMenuItem(
                                value: theme,
                                child: Center(
                                  child: Text(
                                      ApplicationLocalizations.of(context)!
                                          .translate(theme)),
                                )))
                            .toList(),
                        onChanged: (String? newTheme) =>
                            controller.changeTheme(newTheme)),
                    Expanded(child: Column()),
                      GlassButton(ApplicationLocalizations.of(context)!.translate("user_settings"), controller.userSettings),
                      SizedBox(height: 20,),
                      GlassButton(ApplicationLocalizations.of(context)!.translate("logout"), controller.logout),
                      SizedBox(height: 20,),
                    Center(
                      child: Text(
                          "v${controller.packageInfo.version}+${controller.packageInfo.buildNumber}"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
