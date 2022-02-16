// database.dart

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/actor_dao.dart';
import 'dao/actors_for_movies_dao.dart';
import 'dao/genre_dao.dart';
import 'dao/movie_dao.dart';
import 'dao/movies_for_genres_dao.dart';
import 'models/actor_model.dart';
import 'models/actors_for_movies.dart';
import 'models/genre_model.dart';
import 'models/movie_model.dart';
import 'models/movies_for_genres.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [
  ActorModel,
  MovieModel,
  GenreModel,
  ActorsForMovies,
  MoviesForGenres
])
abstract class AppDatabase extends FloorDatabase {
  ActorDao get actorDao;
  MovieDao get movieDao;
  GenreDao get genreDao;
  ActorsForMoviesDao get actorsForMoviesDao;
  MoviesForGenresDao get moviesForGenresDao;
}
