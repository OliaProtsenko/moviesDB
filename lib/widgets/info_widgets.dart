
import 'package:flutter/material.dart';

Widget titleView(String title) {
  return Text(title,
      softWrap: true,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ));
}

Widget dateView(String date) {
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
            softWrap: true,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 17,
                fontWeight: FontWeight.w400)),
      )
    ]),
  );
}

Widget ratingView(double rating) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Text(
        rating.toString(),
        softWrap: true,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    )
  ]);
}

Widget overview(String title, String overview) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 8.0, bottom: 10.0),
        child: Text(overview,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      ),
    ],
  );
}
