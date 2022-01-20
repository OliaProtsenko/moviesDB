import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/widgets/movie_details_widgets.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 0.0,
            left: 0.0,
            height: 200.0,
            right: 0.0,
            child:
                Image.network('${movie.backdropImageUrl}', fit: BoxFit.fill)),
        Positioned(
          top: 175.0,
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          child: MovieInfo(movie),
        ),
        Positioned(
          top: 150.0,
          left: 20.0,
          child: Image.network(movie.imageUrl!, height: 200.0),
        )
      ],
    );
  }
}

Widget MovieInfo(MovieModel movie) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        border: Border.all(width: 1.0, color: Colors.white)),
    child: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              movieTitle(movie.title),
              movieDate(movie.date),
              movieRating(movie.rating),

            ],
          ),
        ),
        movieOverview(movie.overview)
      ],
    ),
  );
}
