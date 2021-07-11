import 'package:flutter/material.dart';

import 'colorsTheme.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = ColorsTheme.fiveColor;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(width, 0);
    ovalPath.quadraticBezierTo(width, height, 0, height);
    ovalPath.lineTo(width, height);
    ovalPath.close();

    paint.color = ColorsTheme.white;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}