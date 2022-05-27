import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/home/home.dart';
import 'package:projekt_pum/modules/main/home/home.view.dart';
import 'package:tuple/tuple.dart';

class HomePageController extends State<HomePage> {
  HomePageController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) => HomePageView(this);

}
