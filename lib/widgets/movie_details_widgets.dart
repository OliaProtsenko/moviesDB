import 'package:flutter/material.dart';

Widget movieTitle(String title) {
  return Text(title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ));
}

Widget movieDate(String date) {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
    const Icon(Icons.calendar_today),
    Text(date,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
  ]);
}

Widget movieRating(double rating) {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
    const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    Text(rating.toString())
  ]);
}

Widget movieOverview(String overview) {
  return Column(
    children: <Widget>[
      const Text(
        "Overview",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
      ),
      Text(overview),
    ],
  );
}
