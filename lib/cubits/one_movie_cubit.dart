import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/one_movie_state.dart';
import 'package:movies/models/actor_model.dart';
import 'package:movies/repository/database_repository.dart';

class OneMovieCubit extends Cubit<OneMovieState> {
  final int movieId;
  final DatabaseRepository databaseRepository;
  OneMovieCubit({required this.databaseRepository, required this.movieId})
      : super(InitialState()) {
    getChosenMovie(movieId);
  }

  void getChosenMovie(int movieId) async {
    try {
      emit(LoadingState());
      final movie = await databaseRepository.getMovieById(movieId, false);
      final List<ActorModel> actors =
          await databaseRepository.getActorsForMovie(movieId, false);
      (movie != null) ? emit(LoadedState(movie, actors)) : ErrorState();
    } catch (e) {
      emit(ErrorState());
    }
  }
}
