import 'package:equatable/equatable.dart';

import '../models/movie_model.dart';

abstract class SearchMovieState extends Equatable {}

class InitialState extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class LoadedState extends SearchMovieState {
  LoadedState(this.movies);

  final List<MovieModel> movies;

  @override
  List<Object> get props => [movies];
}

class ErrorState extends SearchMovieState {
  @override
  List<Object> get props => [];
}
