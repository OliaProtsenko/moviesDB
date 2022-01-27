import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/one_movie_state.dart';
import 'package:movies/repository.dart';


class OneMovieCubit extends Cubit<OneMovieState> {
  final String movieId;
  OneMovieCubit({required this.repository,required this.movieId}) : super(InitialState()) {
  getChosenMovie(movieId);
  }

 
  void getChosenMovie(String movieId) async{
    try {
      emit(LoadingState());
      final movie = await repository.searchMovieById(movieId: movieId);
      final actors=await repository.getActorsForFilm(movieId: movieId);
      emit(LoadedState(movie,actors));
    }
    catch(e){
      //emit(ErrorState());
    }
  }

  final MovieRepository repository;
}
