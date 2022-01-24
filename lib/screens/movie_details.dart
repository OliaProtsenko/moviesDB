import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/one_movie_cubit.dart';
import 'package:movies/cubits/one_movie_state.dart';
import 'package:movies/models/actor_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/repository.dart';
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
              columnChildren: [
                titleView(movie.title),
                dateView(movie.date),
                ratingView(movie.rating),
              ],
              listChildren: [
                overview("Overview", movie.overview),
                ActorsForMovieView(movieId: movie.id),
              ],
            ),
            movie.imageUrl!));
  }
}
