import 'package:flutter/material.dart';
import 'package:movies/constants_for_widgets.dart';

Widget infoWidget(
    {required List<Widget> columnChildren,
    required List<Widget> listChildren,
    required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(borderRadiusForDetailsBackground),
            topRight: Radius.circular(borderRadiusForDetailsBackground)),
        border: Border.all(
            width: borderWidthDetailsBackground,
            color: Theme.of(context).colorScheme.background)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0,
              left: 200.0,
              bottom: 40.0,
              right: horizontalPaddingForMainInfo),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columnChildren,
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: listChildren,
          ),
        ),
      ],
    ),
  );
}
