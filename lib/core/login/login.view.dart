import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projekt_pum/core/login/login.controller.dart';
import 'package:projekt_pum/core/login/login.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/bubble_background/bubble_background.dart';
import 'package:projekt_pum/utils/ui/glass_button/glass_button.dart';
import 'package:projekt_pum/utils/ui/glass_textfield/glass_textfield.dart';
import 'package:widget_view/widget_view.dart';

class LoginPageView extends StatefulWidgetView<LoginPage, LoginPageController> {
  const LoginPageView(LoginPageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            BubbleBackground(size: size),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .1),
                    child: Text(
                      'Projekt PUM',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        wordSpacing: 4,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlassTextField(
                          onChanged: (String value) =>
                              controller.updatePhoneValue(value),
                          icon: Icons.account_circle_outlined,
                          hintText: ApplicationLocalizations.of(context)!
                              .translate("phone_number"),
                          inputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[0-9]{1,9}')),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GlassButton(
                                ApplicationLocalizations.of(context)!
                                    .translate("login")
                                    .toUpperCase(),
                                () {
                                  HapticFeedback.lightImpact();
                                  controller.login();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
