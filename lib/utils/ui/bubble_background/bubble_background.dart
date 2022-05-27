import 'dart:async';

import 'package:flutter/material.dart';

class BubbleBackground extends StatefulWidget {
  const BubbleBackground({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BubbleBackground> createState() => _BubbleBackgroundState();
}

class _BubbleBackgroundState extends State<BubbleBackground>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: widget.size.height * (animation2.value + .58),
          left: widget.size.width * .21,
          child: CustomPaint(
            painter: MyPainter(50),
          ),
        ),
        Positioned(
          top: widget.size.height * .98,
          left: widget.size.width * .1,
          child: CustomPaint(
            painter: MyPainter(animation4.value - 30),
          ),
        ),
        Positioned(
          top: widget.size.height * .5,
          left: widget.size.width * (animation2.value + .8),
          child: CustomPaint(
            painter: MyPainter(30),
          ),
        ),
        Positioned(
          top: widget.size.height * animation3.value,
          left: widget.size.width * (animation1.value + .1),
          child: CustomPaint(
            painter: MyPainter(60),
          ),
        ),
        Positioned(
          top: widget.size.height * .1,
          left: widget.size.width * .8,
          child: CustomPaint(
            painter: MyPainter(animation4.value),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
              colors: [Colors.white70, Colors.white24],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
