import 'package:flutter/material.dart';
import 'package:projekt_pum/core/settings/settings.controller.dart';
import 'package:projekt_pum/core/settings/settings.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:widget_view/widget_view.dart';

class SettingsPageView
    extends StatefulWidgetView<SettingsPage, SettingsPageController> {
  const SettingsPageView(SettingsPageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
                child: Material(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                    color: Colors.white,
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                            items: ([
                              "system",
                              ...ApplicationLocalizations.of(context)!
                                  .getSupportedLanguages()
                            ])
                                .map((String language) => DropdownMenuItem(
                                    value: language,
                                    child: Text(
                                        ApplicationLocalizations.of(context)!
                                            .translate(language))))
                                .toList(),
                            onChanged: (String? newLanguage) =>
                                controller.changeLanguage(newLanguage)),
                        DropdownButtonFormField(
                            items: (["system", "dark", "light"])
                                .map((String theme) => DropdownMenuItem(
                                    value: theme,
                                    child: Text(
                                        ApplicationLocalizations.of(context)!
                                            .translate(theme))))
                                .toList(),
                            onChanged: (String? newTheme) =>
                                controller.changeTheme(newTheme))
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
