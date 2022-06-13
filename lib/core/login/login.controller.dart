import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/core/login/login.dart';
import 'package:projekt_pum/core/login/login.view.dart';
import 'package:projekt_pum/core/verify-code/verify-code.dart';

class LoginPageController extends State<LoginPage>
    with TickerProviderStateMixin {
  LoginPageController();

  String phoneNumber = "";

  login() async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => VerifyCodePage(phoneNumber: phoneNumber))));
  }

  updatePhoneValue(String value) {
    phoneNumber = "+48 $value";
  }

  @override
  Widget build(BuildContext context) => LoginPageView(this);
}
