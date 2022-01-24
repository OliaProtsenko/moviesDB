import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/cubits/movies_state.dart';
import 'package:movies/repository.dart';

import '../models/movie_model.dart';


class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.repository}) : super(InitialState()) {
    getTrendingMovies();
  }

  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final categories = await repository.getGenres();
      Map<GenreModel, List<MovieModel>> moviesByGenres = {};
      for (var item in categories) {
        final movies = await repository.getMovies(genre: item);
        moviesByGenres[item] = movies;
      }
      emit(LoadedState(moviesByGenres));
    } catch (e) {
      emit(ErrorState());
    }
  }


  final MovieRepository repository;
}