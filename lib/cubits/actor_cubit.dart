import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/actor_state.dart';
import 'package:movies/repository/database_repository.dart';

class ActorCubit extends Cubit<ActorState> {
  final int actorId;
  final DatabaseRepository databaseRepository;

  ActorCubit({required this.databaseRepository, required this.actorId})
      : super(InitialState()) {
    getChosenActor(actorId);
  }

  void getChosenActor(int actorId) async {
    try {
      emit(LoadingState());
      final actor = await databaseRepository.getActorById(actorId, false);
      if (actor != null) {
        emit(LoadedState(actor));
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}
