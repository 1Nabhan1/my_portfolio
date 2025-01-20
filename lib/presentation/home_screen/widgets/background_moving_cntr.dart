import 'dart:ui';

import 'package:flutter/material.dart';

class MovingGradientPainter extends CustomPainter {
  final double animationValue;

  MovingGradientPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      colors: [
        Colors.black,
        Color(0xF301093E),
        Colors.black,
      ],
      stops: [
        0.1 + animationValue * 0.4,
        1.0,
        1.1 - animationValue * 0.4,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.repeated,
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}