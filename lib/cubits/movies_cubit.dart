import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/movies_state.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/repository/database_repository.dart';

import '../models/movie_model.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.databaseRepository}) : super(InitialState()) {
    getTrendingMovies();
  }

  void getTrendingMovies() async {
    try {
      emit(LoadingState());

      Map<GenreModel, List<MovieModel>> moviesByGenres = {};
      final categories = await databaseRepository.getAllGenres(false);
      for (var item in categories) {
        final movies =
            await databaseRepository.getAllMoviesOfGenre(item, false);
        moviesByGenres[item] = movies;
      }
      emit(LoadedState(moviesByGenres));
    } catch (e) {
      emit(ErrorState());
    }
  }

  final DatabaseRepository databaseRepository;
}
