import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/main/main.controller.dart';
import 'package:projekt_pum/modules/main/main.dart';
import 'package:widget_view/widget_view.dart';

class MainView extends StatefulWidgetView<Main, MainController> {
  const MainView(MainController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageTransitionSwitcher(
              duration: const Duration(milliseconds: 500),
              reverse: controller.isReversing,
              transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal);
              },
              child:
                  controller.widgetOptions.elementAt(controller.selectedIndex)),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: NavBar(
                selectedIndex: controller.selectedIndex,
                onTap: (int index) => {
                  controller.setState(() {
                    controller.isReversing = controller.selectedIndex > index;
                    controller.selectedIndex = index;
                  })
                },
              )),
        ],
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  final void Function(int) onTap;
  final int selectedIndex;

  const NavBar({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: const Radius.circular(50)),
      color: const Color(0xFF1877f2),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              iconSize: 30,
              color: Colors.white,
              onPressed: () => widget.onTap(0),
              splashRadius: MediaQuery.of(context).size.width / 4,
              icon: const FaIcon(FontAwesomeIcons.brain)),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(50),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width / 3,
              child: Material(
                child: IconButton(
                    iconSize: 30,
                    color: const Color(0xFF1877f2),
                    splashRadius: MediaQuery.of(context).size.width / 6,
                    splashColor: const Color(0xFF1877f2),
                    onPressed: () => widget.onTap(1),
                    icon: const FaIcon(FontAwesomeIcons.house)),
              ),
            ),
          ),
          IconButton(
              iconSize: 30,
              color: Colors.white,
              onPressed: () => widget.onTap(2),
              splashRadius: MediaQuery.of(context).size.width / 4,
              icon: const FaIcon(FontAwesomeIcons.chartBar)),
        ],
      ),
    );
  }
}
