import 'package:equatable/equatable.dart';
import 'package:movies/models/actor_model.dart';
import 'package:movies/models/movie_model.dart';

abstract class OneMovieState extends Equatable {}

class InitialState extends OneMovieState {
  @override
  List<Object> get props => [];
}

class LoadingState extends OneMovieState {
  @override
  List<Object> get props => [];
}

class LoadedState extends OneMovieState {
  LoadedState(this.movie, this.actors);
  final MovieModel movie;
  final List<ActorModel> actors;
  @override
  List<Object> get props => [actors];
}

class ErrorState extends OneMovieState {
  @override
  List<Object> get props => [];
}
