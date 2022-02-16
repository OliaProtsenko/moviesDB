import 'package:flutter/material.dart';
import 'package:movies/constants_for_widgets.dart';

Widget detailsBackground(
    Widget backgroundImage, Widget info, String? mainImageURL,
    [int? id]) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: startPosition,
        left: startPosition,
        height: imageHeight,
        right: startPosition,
        child: backgroundImage,
      ),
      Positioned(
        top: 175.0,
        left: startPosition,
        bottom: startPosition,
        right: startPosition,
        child: info,
      ),
      Positioned(
        top: 130.0,
        left: 20.0,
        child: Hero(
          tag: "$id",
          child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadiusForImages),
              child: (mainImageURL != null)
                  ? Image.network(mainImageURL, height: imageHeight)
                  : const Icon(Icons.photo)),
        ),
      )
    ],
  );
}
