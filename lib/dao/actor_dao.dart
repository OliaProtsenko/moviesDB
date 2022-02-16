import 'package:floor/floor.dart';
import 'package:movies/models/actor_model.dart';

@dao
abstract class ActorDao {
  @Query('SELECT* FROM ActorModel')
  Future<List<ActorModel>?> getAllRecords();

  @Query('SELECT*FROM ActorModel WHERE id =:id')
  Future<ActorModel?> findActorById(int id);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateActor(ActorModel actor);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertActor(ActorModel actor);

  @delete
  Future<void> deleteActor(ActorModel actor);

  @delete
  Future<int> deleteActors(List<ActorModel> actors);
}
