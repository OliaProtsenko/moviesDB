import 'package:floor/floor.dart';
import 'package:movies/models/genre_model.dart';

@dao
abstract class GenreDao {
  @Query('SELECT DISTINCT * FROM GenreModel')
  Future<List<GenreModel>?> getAllRecords();
  @Query('SELECT*FROM GenreModel WHERE id =:id')
  Future<GenreModel?> findGenreById(int id);

  @Query('SELECT*FROM GenreModel WHERE name =:name')
  Future<GenreModel?> findGenreByName(String name);
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertGenre(GenreModel actor);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateGenre(GenreModel genre);
  @delete
  Future<void> deleteGenre(GenreModel genre);

  @delete
  Future<int> deleteGenres(List<GenreModel> genre);
}
