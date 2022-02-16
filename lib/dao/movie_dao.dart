import 'package:floor/floor.dart';
import 'package:movies/models/movie_model.dart';

@dao
abstract class MovieDao {
  @Query('SELECT* FROM MovieModel')
  Future<List<MovieModel>?> getAllRecords();
  @Query('SELECT * FROM MovieModel WHERE id =:id')
  Future<MovieModel?> findMovieById(int id);

  @Query('SELECT * FROM MovieModel WHERE title =:title')
  Future<MovieModel?> findMovieByTitle(String title);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertMovie(MovieModel movie);
  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateMovie(MovieModel movie);
  @delete
  Future<void> deleteMovie(MovieModel movie);

  @delete
  Future<int> deleteActors(List<MovieModel> movies);
}
