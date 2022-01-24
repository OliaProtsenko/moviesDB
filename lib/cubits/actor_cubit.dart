
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/actor_state.dart';
import 'package:movies/repository.dart';

class ActorCubit extends Cubit<ActorState> {
  final String actorId;
  ActorCubit({required this.repository,required this.actorId}) : super(InitialState()) {
    getChosenMovie(actorId);
  }


  void getChosenMovie(String movieId) async{
     try {
    emit(LoadingState());
    final actor=await repository.getActorById(actorId: actorId);
    emit(LoadedState(actor));
    }
    catch(e){
    emit(ErrorState());
    }
  }

  final MovieRepository repository;
}
