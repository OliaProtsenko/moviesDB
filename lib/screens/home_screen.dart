import 'package:flutter/material.dart';
import 'package:movies/movies_cubit.dart';
import 'package:movies/movies_state.dart';
import 'package:movies/models/movie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/movie_details.dart';
import '../models/genre_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
      if (state is LoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ErrorState) {
        return const Center(
          child: Icon(Icons.close),
        );
      } else if (state is LoadedState) {
        final movies = state.movies;
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, i) {
              GenreModel key = movies.keys.elementAt(i);
              return listMoviesOfGenre(key, context, movies[key]!);
            });
      } else if (state is LoadedOneMovieState) {
        final movie = state.movie;
        return MovieDetails(movie: movie);
      }
      throw Exception();
    });
  }
}

Widget listMoviesOfGenre(
    GenreModel genre, BuildContext context, List<MovieModel> movies) {
  return Column(
    children: <Widget>[
      Text(genre.name),
      Container(
        child: ListView.builder(
            itemCount: (movies.isEmpty) ? 0 : 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return IconButton(
                  icon: (movies[index].imageUrl != null)
                      ? Image.network(movies[index].imageUrl!)
                      : const Icon(Icons.downloading),
                  iconSize: 150,
                  onPressed: () {
                    context.read<MoviesCubit>().getChosenMovie(movies[index].id);
                  });
            }),
        height: 300.0,
      ),
    ],
  );
}
