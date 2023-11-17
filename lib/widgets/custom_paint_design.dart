import 'package:flutter/material.dart';
import 'package:ui_healthy_food/utils/constants.dart';

class CustomPaintDesign extends StatelessWidget {
  final double height;

  const CustomPaintDesign({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: WaveClipper(),
        child: Container(
          color: ColorsPallete.primaryColor,
          height: height,
          width: MediaQuery.of(context).size.width,
        ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());

    var path = Path();

    path.lineTo(0, size.height); //start path with this if you are making

    var firstStart = Offset(size.width / 5, size.height - 50);

    var firstEnd = Offset(size.width / 2.25, size.height - 30.0);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height + 20);

    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0); //end with this path if you are
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
