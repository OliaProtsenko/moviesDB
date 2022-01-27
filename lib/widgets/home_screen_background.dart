import 'package:flutter/material.dart';

Widget detailsBackground(
    Widget backgroundImage, Widget info, String mainImageURL) {
  return Stack(children: <Widget>[
    Positioned(
      top: 0.0,
      left: 0.0,
      height: 200.0,
      right: 0.0,
      child: backgroundImage,
    ),
    Positioned(
      top: 175.0,
      left: 0.0,
      bottom: 0.0,
      right: 0.0,
      child: Container(),
    ),
  ]);
}

class HomeBackground extends StatelessWidget {
  const HomeBackground(
      {Key? key, required this.backgroundImage, required this.child})
      : super(key: key);
  final Widget backgroundImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          child: Container(
        color: Theme.of(context).colorScheme.background,
      )),
      Positioned(
        child: ClipPath(
          child: Container(
            color: Colors.cyan,
            child: backgroundImage,
          ),
          clipper: _MyClipper(),
        ),
      ),
      Positioned(
        child: child,
      )
    ]);

  }
}

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.65);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
