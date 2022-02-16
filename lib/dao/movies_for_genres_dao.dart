import 'package:floor/floor.dart';
import 'package:movies/models/movies_for_genres.dart';

@dao
abstract class MoviesForGenresDao {
  @Query('SELECT* FROM MoviesForGenres')
  Future<List<MoviesForGenres>?> getAllRecords();
  @Query('SELECT*FROM MoviesForGenres WHERE genreId =:id')
  Future<List<MoviesForGenres>?> findByGenreId(int id);

  @Query('SELECT*FROM MoviesForGenres WHERE movieId =:id')
  Future<List<MoviesForGenres>?> findByMovieId(int id);

  @insert
  Future<void> insertMoviesForGenres(MoviesForGenres actor);
  @delete
  Future<void> deleteMovieForGenre(MoviesForGenres movieForGenre);

  @delete
  Future<int> deleteMoviesForGenres(List<MoviesForGenres> moviesForGenres);
}
