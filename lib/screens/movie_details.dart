import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/widgets/actors_list_view.dart';
import 'package:movies/widgets/details_background.dart';
import 'package:movies/widgets/structure_info_widget.dart';
import 'package:movies/widgets/info_widgets.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: detailsBackground(
            Image.network(movie.backdropImageUrl!, fit: BoxFit.fill),
            infoWidget(
              context: context,
              columnChildren: [
                titleView(movie.title, context),
                dateView(movie.date, context),
                ratingView(movie.rating, context),
              ],
              listChildren: [
                overview("Overview", movie.overview, context),
                ActorsForMovieView(movieId: movie.id),
              ],
            ),
            movie.imageUrl!));
  }
}
