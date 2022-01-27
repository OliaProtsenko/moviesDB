import 'package:flutter/material.dart';

Widget titleView(String title, BuildContext context) {
  return Text(title,
      softWrap: true, style: Theme.of(context).textTheme.headline1);
}

Widget dateView(String date, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10.0,
      bottom: 5.0,
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      const Icon(Icons.calendar_today),
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
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
      padding: const EdgeInsets.only(left: 5.0),
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
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 8.0, bottom: 10.0),
        child: Text(
          overview,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    ],
  );
}
