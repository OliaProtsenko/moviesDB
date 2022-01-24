import 'package:flutter/material.dart';

Widget detailsBackground(
    Widget backgroundImage, Widget info, String mainImageURL) {
  return Stack(
    children: <Widget>[
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
        child: info,
      ),
      Positioned(
        top: 130.0,
        left: 20.0,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(mainImageURL, height: 200.0)),
      )
    ],
  );
}
