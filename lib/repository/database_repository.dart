import 'package:movies/models/actor_model.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:scoped_model/scoped_model.dart';

abstract class DatabaseRepository extends Model {
  bool shouldRefreshFromApi(bool forceRefresh, DateTime? lastFetchTime);

  Future<void> refreshMoviesAndGenres(bool notifyListeners);

  Future<void> refreshActorsForMovie(bool notifyListeners, int movieId);

  Future<void> updateGenre(GenreModel genre);

  Future<void> updateMovie(MovieModel movie, GenreModel genre);

  Future<void> updateActor(ActorModel actor, MovieModel movie);

  Future<void> insertMoviesForGenres(MovieModel movie, GenreModel genre);

  Future<void> insertActorsForMovies(MovieModel movie, ActorModel actor);

  Future<List<GenreModel>> getAllGenres(bool forceRefresh);

  Future<List<MovieModel>> getAllMoviesOfGenre(
      GenreModel genre, bool forceRefresh);
  Future<List<ActorModel>> getActorsForMovie(int movieId, bool forceRefresh);
  Future<ActorModel?> getActorById(int actorId, bool forceRefresh);
  Future<MovieModel?> getMovieById(int movieId, bool forceRefresh);
}
