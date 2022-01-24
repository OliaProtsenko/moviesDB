import 'package:equatable/equatable.dart';

import '../models/genre_model.dart';
import '../models/movie_model.dart';

abstract class MoviesState extends Equatable {}

class InitialState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MoviesState {
  LoadedState(this.movies);

  final Map<GenreModel, List<MovieModel>> movies;

  @override
  List<Object> get props => [movies];
}



class ErrorState extends MoviesState {
  @override
  List<Object> get props => [];
}
