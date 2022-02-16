import 'dart:core';

import 'package:movies/dao/actor_dao.dart';
import 'package:movies/dao/actors_for_movies_dao.dart';
import 'package:movies/dao/genre_dao.dart';
import 'package:movies/dao/movie_dao.dart';
import 'package:movies/dao/movies_for_genres_dao.dart';
import 'package:movies/database.dart';
import 'package:movies/models/actor_model.dart';
import 'package:movies/models/actors_for_movies.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/models/movies_for_genres.dart';
import 'package:movies/repository/database_repository.dart';
import 'package:movies/repository/repository.dart';
import 'package:scoped_model/scoped_model.dart';

class DatabaseRepositoryImplementation extends Model
    implements DatabaseRepository {
  final Duration _cacheValidDuration = const Duration(minutes: 30);
  DateTime? _lastFetchTimeMovies = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime? _lastFetchTimeActors = DateTime.fromMillisecondsSinceEpoch(0);
  final AppDatabase database;
  final MovieRepository httpRepository;
  final ActorDao actorsDao;
  final MovieDao movieDao;
  final GenreDao genreDao;
  final ActorsForMoviesDao actorsForMoviesDao;
  final MoviesForGenresDao moviesForGenresDao;

  DatabaseRepositoryImplementation(
      {required this.database, required this.httpRepository})
      : actorsDao = database.actorDao,
        movieDao = database.movieDao,
        genreDao = database.genreDao,
        moviesForGenresDao = database.moviesForGenresDao,
        actorsForMoviesDao = database.actorsForMoviesDao;

  @override
  bool shouldRefreshFromApi(bool forceRefresh, DateTime? lastFetchTime) {
    bool shouldRefreshFromApi = (null == lastFetchTime ||
        lastFetchTime.isBefore(DateTime.now().subtract(_cacheValidDuration)) ||
        forceRefresh);
    return shouldRefreshFromApi;
  }

  @override
  Future<void> refreshMoviesAndGenres(bool notifyListeners) async {
    final freshGenres = await httpRepository.getGenres();
    for (var genre in freshGenres) {
      updateGenre(genre);
      final freshMoviesForGenres = await httpRepository.getMovies(genre: genre);
      for (var movie in freshMoviesForGenres) {
        updateMovie(movie, genre);
      }
    }
    _lastFetchTimeMovies = DateTime.now();
    if (notifyListeners) this.notifyListeners();
  }

  @override
  Future<void> refreshActorsForMovie(bool notifyListeners, int movieId) async {
    final movie = await database.movieDao.findMovieById(movieId);
    if (movie != null) {
      final actors = await httpRepository.getActorsForMovie(movieId: movie.id);
      for (var item in actors) {
        final actor = await httpRepository.getActorById(actorId: item.id);
        updateActor(actor, movie);
      }
    }
    _lastFetchTimeActors = DateTime.now();
    if (notifyListeners) this.notifyListeners();
  }

  @override
  Future<void> updateGenre(GenreModel genre) async {
    int count = await database.genreDao.updateGenre(genre);
    if (count == 0) {
      await database.genreDao.insertGenre(genre);
    }
  }

  @override
  Future<void> updateMovie(MovieModel movie, GenreModel genre) async {
    int count = await database.movieDao.updateMovie(movie);
    if (count == 0) {
      await database.movieDao.insertMovie(movie);
      await insertMoviesForGenres(movie, genre);
    }
  }

  @override
  Future<void> updateActor(ActorModel actor, MovieModel movie) async {
    int count = await database.actorDao.updateActor(actor);
    if (count == 0) {
      await database.actorDao.insertActor(actor);
      await insertActorsForMovies(movie, actor);
    }
  }

  @override
  Future<void> insertMoviesForGenres(MovieModel movie, GenreModel genre) async {
    await database.moviesForGenresDao.insertMoviesForGenres(
        MoviesForGenres(id: null, movieId: movie.id, genreId: genre.id));
  }

  @override
  Future<void> insertActorsForMovies(MovieModel movie, ActorModel actor) async {
    await database.actorsForMoviesDao.insertActorsForMovies(
        ActorsForMovies(id: null, movieId: movie.id, actorId: actor.id));
  }

  @override
  Future<List<GenreModel>> getAllGenres(bool forceRefresh) async {
    if (shouldRefreshFromApi(forceRefresh, _lastFetchTimeMovies)) {
      await refreshMoviesAndGenres(true);
    }
    List<GenreModel>? result = await database.genreDao.getAllRecords();
    List<GenreModel> empty = [];
    return (result == null) ? Future.value(empty) : Future.value(result);
  }

  @override
  Future<List<MovieModel>> getAllMoviesOfGenre(
      GenreModel genre, bool forceRefresh) async {
    if (shouldRefreshFromApi(forceRefresh, _lastFetchTimeMovies)) {
      await refreshMoviesAndGenres(true);
    }
    List<MovieModel> result = [];
    final moviesForGenres =
        await database.moviesForGenresDao.findByGenreId(genre.id);
    if (moviesForGenres != null) {
      for (var movie in moviesForGenres) {
        final item = await database.movieDao.findMovieById(movie.movieId);
        if (item != null) {
          result.add(item);
        }
      }
    }

    return Future.value(result);
  }

  @override
  Future<List<ActorModel>> getActorsForMovie(
      int movieId, bool forceRefresh) async {
    if (shouldRefreshFromApi(forceRefresh, _lastFetchTimeActors)) {
      await refreshActorsForMovie(true, movieId);
    }
    List<ActorsForMovies>? actorsId =
        await database.actorsForMoviesDao.findByMovieId(movieId);
    List<ActorModel> result = [];
    if (actorsId != null) {
      for (var item in actorsId) {
        final actor = await database.actorDao.findActorById(item.actorId);
        if (actor != null) {
          result.add(actor);
        }
      }
    }
    return Future.value(result);
  }

  @override
  Future<ActorModel?> getActorById(int actorId, bool forceRefresh) async {
    ActorModel? actor = await database.actorDao.findActorById(actorId);

    return Future.value(actor);
  }

  @override
  Future<MovieModel?> getMovieById(int movieId, bool forceRefresh) async {
    if (shouldRefreshFromApi(forceRefresh, _lastFetchTimeMovies)) {
      await refreshActorsForMovie(true, movieId);
    }
    MovieModel? movie = await database.movieDao.findMovieById(movieId);
    return Future.value(movie);
  }
}
