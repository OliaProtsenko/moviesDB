import 'package:floor/floor.dart';
import 'package:movies/models/actors_for_movies.dart';

@dao
abstract class ActorsForMoviesDao {
  @Query('SELECT* FROM ActorsForMovies')
  Future<List<ActorsForMovies>?> getAllRecords();
  @Query('SELECT*FROM ActorsForMovies WHERE actor_id =:id')
  Future<List<ActorsForMovies>?> findByActorId(int id);

  @Query('SELECT*FROM ActorsForMovies WHERE movie_id =:id')
  Future<List<ActorsForMovies>?> findByMovieId(int id);

  @insert
  Future<void> insertActorsForMovies(ActorsForMovies actor);
  @delete
  Future<void> deleteActorForMovie(ActorsForMovies actorForMovie);

  @delete
  Future<int> deleteActorsForMovies(List<ActorsForMovies> actorsForMovies);
}
