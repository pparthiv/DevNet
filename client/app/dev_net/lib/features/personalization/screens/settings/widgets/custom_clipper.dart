import 'package:flutter/material.dart';

class SettingsCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);
    final first1 = Offset(0, size.height - 30);
    final second1 = Offset(30, size.height - 30);
    path.quadraticBezierTo(first1.dx, first1.dy, second1.dx, second1.dy);

    path.lineTo(size.width - 30, size.height - 30);

    final first2 = Offset(size.width, size.height - 30);
    final second2 = Offset(size.width, size.height);
    path.quadraticBezierTo(first2.dx, first2.dy, second2.dx, second2.dy);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
