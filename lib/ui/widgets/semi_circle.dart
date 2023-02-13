import 'dart:math';

import 'package:flutter/material.dart';

class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    var center = Offset(size.width / 2, size.height / 2);
    var radius = min(size.width, size.height) / 2;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        45 * pi / 180, 180 * pi / 180, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SemiCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SemiCirclePainter(),
    );
  }
}
