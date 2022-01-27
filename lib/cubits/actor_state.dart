import 'package:equatable/equatable.dart';
import 'package:movies/models/actor_model.dart';


abstract class ActorState extends Equatable {}

class InitialState extends ActorState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ActorState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ActorState {
  LoadedState(this.actor);

  final ActorModel actor;

  @override
  List<Object> get props => [actor.id];
}


class ErrorState extends ActorState {
  @override
  List<Object> get props => [];
}
