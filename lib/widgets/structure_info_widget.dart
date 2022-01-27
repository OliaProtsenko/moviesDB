import 'package:flutter/material.dart';

Widget infoWidget(
    {required List<Widget> columnChildren,
    required List<Widget> listChildren,
    required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        border: Border.all(
            width: 1.0, color: Theme.of(context).colorScheme.background)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 200.0, bottom: 40.0, right: 5.0),
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
