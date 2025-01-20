import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/const_details.dart';

class SvgPathPainter extends CustomPainter {
  final Path path;
  final double progress;
  final double fillOpacity;

  SvgPathPainter({
    required this.path,
    required this.progress,
    required this.fillOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = ConstDetails().prmClr
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final fillPaint = Paint()
      ..color = ConstDetails().prmClr.withValues(alpha: fillOpacity)
      ..style = PaintingStyle.fill;

    final Rect bounds = path.getBounds();
    final double scaleX = size.width / bounds.width;
    final double scaleY = size.height / bounds.height;
    final double scale = scaleX < scaleY ? scaleX : scaleY;

    final Matrix4 scaleMatrix = Matrix4.identity()
      ..translate(
        (size.width - bounds.width * scale) / 2,
        (size.height - bounds.height * scale) / 2,
      )
      ..scale(scale, scale);

    final scaledPath = path.transform(scaleMatrix.storage);

    final PathMetrics pathMetrics = scaledPath.computeMetrics();
    final Path drawingPath = Path();

    for (final metric in pathMetrics) {
      final lengthToDraw = metric.length * progress;
      drawingPath.addPath(metric.extractPath(0, lengthToDraw), Offset.zero);
    }

    canvas.drawPath(drawingPath, strokePaint);

    if (progress >= 1.0) {
      canvas.drawPath(scaledPath, fillPaint);
    }
  }

  @override
  bool shouldRepaint(SvgPathPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.fillOpacity != fillOpacity;
  }
}
