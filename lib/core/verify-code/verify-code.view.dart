import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projekt_pum/core/verify-code/verify-code.controller.dart';
import 'package:projekt_pum/core/verify-code/verify-code.dart';
import 'package:widget_view/widget_view.dart';

class VerifyCodePageView extends StatefulWidgetView<VerifyCodePage, VerifyCodePageController> {
  const VerifyCodePageView(VerifyCodePageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.status != Status.Error
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("OTP Verification",
                      style: TextStyle(
                          color: Color(0xFF08C187).withOpacity(0.7),
                          fontSize: 30)),
                ),
                Text("Enter OTP sent to",
                    style: TextStyle(
                        color: Colors.red, fontSize: 20)),
                Text(controller.phoneNumber == null ? "" : controller.phoneNumber),
                TextField(
                    onChanged: (value) async {
                      print(value);
                      if (value.length == 6) {
                        //perform the auth verification
                        controller.sendCodeToFirebase(code: value);
                      }
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(letterSpacing: 30, fontSize: 30),
                    maxLength: 6,
                    controller: controller.textEditingController,
                    keyboardType: TextInputType.number),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't receive the OTP?"),
                    TextButton(
                        child: Text("RESEND OTP"),
                        onPressed: () async {
                          controller.setState(() {
                            controller.status = Status.Waiting;
                          });
                          controller.verifyPhoneNumber();
                        })
                  ],
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("OTP Verification",
                      style: TextStyle(
                          color: Color(0xFF08C187).withOpacity(0.7),
                          fontSize: 30)),
                ),
                Text("The code used is invalid!"),
                TextButton(
                    child: Text("Edit Number"),
                    onPressed: () => Navigator.pop(context)),
                TextButton(
                    child: Text("Resend Code"),
                    onPressed: () async {
                      controller.setState(() {
                        controller.status = Status.Waiting;
                      });

                      controller.verifyPhoneNumber();
                    }),
              ],
            ),
    );
  }
}
