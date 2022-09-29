import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/core/user-settings/user-settings.dart';

import 'user-settings.view.dart';


class UserSettingsPageController extends State<UserSettingsPage>
    with TickerProviderStateMixin {
  UserSettingsPageController();

  String? displayName = FirebaseAuth.instance.currentUser?.displayName;
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textFieldController.text = displayName?? "";
  }

  updateDisplayName(String displayName){
    this.displayName= displayName;
  }

   updateUser() async {
   await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
   Navigator.of(context).pop();
   }
   

  @override
  Widget build(BuildContext context) => UserSettingsPageView(this);
}
