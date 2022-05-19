import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/home/home.controller.dart';
import 'package:projekt_pum/modules/main/home/home.dart';
import 'package:widget_view/widget_view.dart';

class HomePageView extends StatefulWidgetView<HomePage, HomePageController> {
  const HomePageView(HomePageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("HomePage"));
  }
}
