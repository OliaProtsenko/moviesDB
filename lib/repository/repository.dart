import 'package:movies/models/actor_model.dart';
import 'package:movies/models/movie_model.dart';

import '../models/genre_model.dart';

abstract class MovieRepository {
  Future<List<GenreModel>> getGenres();

  Future<List<MovieModel>> getMovies({required GenreModel genre});

  Future<MovieModel> searchMovieById({required movieId});

  Future<List<ActorModel>> getActorsForMovie({required movieId});

  Future<ActorModel> getActorById({required actorId});

  Future<List<MovieModel>> searchMovieByName(String search);
}
