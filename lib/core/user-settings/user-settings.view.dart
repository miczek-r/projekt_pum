import 'package:flutter/material.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_button/glass_button.dart';
import 'package:projekt_pum/utils/ui/glass_container/glass_container.dart';
import 'package:projekt_pum/utils/ui/glass_textfield/glass_textfield.dart';
import 'package:widget_view/widget_view.dart';

import 'user-settings.controller.dart';
import 'user-settings.dart';

class UserSettingsPageView
    extends StatefulWidgetView<UserSettingsPage, UserSettingsPageController> {
  const UserSettingsPageView(UserSettingsPageController controller, {Key? key})
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
              ApplicationLocalizations.of(context)!.translate("UserSettings"),
              style: TextStyle(color: Colors.white, fontSize: 40),
            )),
          ),
          Expanded(
            child: GlassContainer(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    GlassTextField(
                          controller: controller.textFieldController,
                          onChanged: (String value) =>
                              controller.updateDisplayName(value),
                          icon: Icons.account_circle_outlined,
                          hintText: ApplicationLocalizations.of(context)!
                              .translate("display_name"),
                        ),
                        Expanded(child: Column()),
                        GlassButton(ApplicationLocalizations.of(context)!.translate("save"), controller.updateUser)
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
