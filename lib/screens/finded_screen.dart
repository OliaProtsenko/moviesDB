import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/search_movie_cubit.dart';
import 'package:movies/cubits/search_movie_state.dart';
import 'package:movies/main.dart';
import 'package:movies/repository/repository.dart';
import 'package:movies/widgets/searching_widgets.dart';

class FoundScreen extends StatelessWidget {
  const FoundScreen({Key? key, required this.searchString}) : super(key: key);
  final String searchString;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchMovieCubit>(
        create: (context) => SearchMovieCubit(
            repository: getIt.get<MovieRepository>(), keyWords: searchString),
        child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
            builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            final movies = state.movies;
            return SuitableMovies(movies: movies);
          } else //if (state is ErrorState) {
          {
            return const Center(
              child: Icon(Icons.close),
            );
          }
        }));
  }
}
