import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projekt_pum/core/verify-code/verify-code.controller.dart';
import 'package:projekt_pum/core/verify-code/verify-code.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/bubble_background/bubble_background.dart';
import 'package:projekt_pum/utils/ui/glass_button/glass_button.dart';
import 'package:projekt_pum/utils/ui/glass_textfield/glass_textfield.dart';
import 'package:widget_view/widget_view.dart';

class VerifyCodePageView
    extends StatefulWidgetView<VerifyCodePage, VerifyCodePageController> {
  const VerifyCodePageView(VerifyCodePageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BubbleBackground(size: MediaQuery.of(context).size),
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: controller.status != Status.Error
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Text("Verification",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text("Enter your confirmation code",
                                    style: TextStyle(
                                        color: Color.fromARGB(200, 63, 63, 63),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(controller.phoneNumber == null
                                    ? ""
                                    : controller.phoneNumber),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Form(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (int i = 0; i < 6; i++)
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                    8 +
                                                4,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        child: GlassTextField(
                                          onChanged: (value) {
                                            controller.setState(() {
                                              controller.verificationCode =
                                                  controller.verificationCode
                                                      .replaceFirst(RegExp('.'),
                                                          value, i);
                                            });
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            } else if (i > 0 && value.isEmpty) {
                                              FocusScope.of(context)
                                                  .previousFocus();
                                            }
                                          },
                                          textAlign: TextAlign.center,
                                          inputFormatter: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                        ),
                                      )
                                  ],
                                )),
                                GlassButton("Verify", () async {
                                  controller.sendCodeToFirebase();
                                }),
                                Row(),
                                GlassButton("Resend Code", () async {
                                  controller.setState(() {
                                    controller.status = Status.Waiting;
                                  });
                                  controller.verifyPhoneNumber();
                                }),
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Text("Verification",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text("For Phone Number",
                                    style: TextStyle(
                                        color: Color.fromARGB(200, 63, 63, 63),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    controller.phoneNumber == null
                                        ? ""
                                        : controller.phoneNumber,
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GlassButton("Resend Code", () async {
                                  controller.setState(() {
                                    controller.status = Status.Waiting;
                                  });

                                  controller.verifyPhoneNumber();
                                }),
                                GlassButton("Change Phone Number", () {
                                  Navigator.of(context).pop();
                                }),
                              ],
                            ),
                          )
                        ],
                      )),
          ),
        ],
      ),
    );
  }
}
