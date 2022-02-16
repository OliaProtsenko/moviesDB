import 'package:flutter/material.dart';
import 'package:movies/constants_for_widgets.dart';

Widget titleView(String title, BuildContext context) {
  return Text(title,
      softWrap: true, style: Theme.of(context).textTheme.headline1);
}

Widget dateView(String date, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: smallLineSpacing,
      bottom: smallLineSpacing,
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      const Icon(Icons.calendar_today),
      Padding(
        padding: const EdgeInsets.only(left: horizontalPaddingForMainInfo),
        child: Text(date,
            softWrap: true, style: Theme.of(context).textTheme.headline3),
      )
    ]),
  );
}

Widget ratingView(double rating, BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    Padding(
      padding: const EdgeInsets.only(left: horizontalPaddingForMainInfo),
      child: Text(rating.toString(),
          softWrap: true, style: Theme.of(context).textTheme.headline4),
    )
  ]);
}

Widget overview(String title, String overview, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: horizontalPaddingForOverview),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: horizontalPaddingForOverview,
            right: horizontalPaddingForOverview,
            top: smallLineSpacing,
            bottom: smallLineSpacing),
        child: Text(
          overview,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    ],
  );
}
