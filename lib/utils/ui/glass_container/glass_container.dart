import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  const GlassContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(.7),
                    Colors.blue.withOpacity(.2),
                  ],
                  center: Alignment(-0.3, 0.3),
                  radius: 3.8,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            child: child),
      ),
    );
  }
}
