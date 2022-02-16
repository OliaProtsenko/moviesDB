import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/search_movie_state.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/repository/repository.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit({required this.repository, required this.keyWords})
      : super(InitialState()) {
    getSuitableMovies(keyWords);
  }
  final String keyWords;
  void getSuitableMovies(String keyWords) async {
    try {
      emit(LoadingState());
      String query = keyWords.replaceAll(" ", "+");

      final List<MovieModel> suitableMovies =
          await repository.searchMovieByName(query);

      emit(LoadedState(suitableMovies));
    } catch (e) {
      emit(ErrorState());
    }
  }

  final MovieRepository repository;
}
