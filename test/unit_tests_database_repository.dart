import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/dao/actor_dao.dart';
import 'package:movies/dao/actors_for_movies_dao.dart';
import 'package:movies/dao/genre_dao.dart';
import 'package:movies/dao/movie_dao.dart';
import 'package:movies/dao/movies_for_genres_dao.dart';
import 'package:movies/database.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/models/movies_for_genres.dart';
import 'package:movies/repository/database_repository.dart';
import 'package:movies/repository/database_repository_implementation.dart';
import 'package:movies/repository/http_repository.dart';
import 'package:test/test.dart';

import 'unit_tests_database_repository.mocks.dart';

@GenerateMocks([
  AppDatabase,
  GenreDao,
  HttpMovieRepository,
  ActorDao,
  MovieDao,
  MoviesForGenresDao,
  ActorsForMoviesDao
])
void main() {
  MockAppDatabase _appDatabase = MockAppDatabase();
  MockHttpMovieRepository _httpRepo = MockHttpMovieRepository();
  MockGenreDao _genreDao = MockGenreDao();
  MockActorDao _actorDao = MockActorDao();
  MockMovieDao _movieDao = MockMovieDao();
  MockMoviesForGenresDao _moviesForGenresDao = MockMoviesForGenresDao();
  MockActorsForMoviesDao _actorsForMoviesDao = MockActorsForMoviesDao();
  late DatabaseRepository databaseRepo;

  setUp(() async {
    when(_appDatabase.genreDao).thenReturn(_genreDao);
    when(_appDatabase.movieDao).thenReturn(_movieDao);
    when(_appDatabase.actorDao).thenReturn(_actorDao);
    when(_appDatabase.moviesForGenresDao).thenReturn(_moviesForGenresDao);
    when(_appDatabase.actorsForMoviesDao).thenReturn(_actorsForMoviesDao);
    databaseRepo = DatabaseRepositoryImplementation(
        database: _appDatabase, httpRepository: _httpRepo);
    when(databaseRepo.refreshMoviesAndGenres(true)).thenAnswer((_) {
      return Future.value();
    });
  });

  test('Get genres when database is empty', () async {
    List<GenreModel> empty = [];

    when(_genreDao.getAllRecords()).thenAnswer((_) {
      return Future.value(null);
    });
    List<GenreModel> result = await databaseRepo.getAllGenres(false);
    expect(result, empty);
  });
  test('Get movies of genre with id=1', () async {
    List<MoviesForGenres> moviesId = [
      MoviesForGenres(genreId: 1, movieId: 1),
      MoviesForGenres(genreId: 1, movieId: 2)
    ];
    int id = 1;
    when(_moviesForGenresDao.findByGenreId(id)).thenAnswer((_) async {
      return Future.value(moviesId);
    });
    when(_movieDao.findMovieById(moviesId[0].movieId)).thenAnswer((_) async {
      return Future.value(MovieModel(
          id: moviesId[0].movieId,
          title: "title1",
          imageUrl: "imageUrl",
          backdropImageUrl: "backdropImageUrl",
          date: "date",
          overview: "overview",
          rating: 10.0));
    });
    when(_movieDao.findMovieById(moviesId[1].movieId)).thenAnswer((_) async {
      return Future.value(MovieModel(
          id: moviesId[1].movieId,
          title: "title2",
          imageUrl: "imageUrl",
          backdropImageUrl: "backdropImageUrl",
          date: "date",
          overview: "overview",
          rating: 10.0));
    });
    List<MovieModel> result = await databaseRepo.getAllMoviesOfGenre(
        GenreModel(id: id, name: "name"), false);
    expect(result.length, 2);
    verify(_moviesForGenresDao.findByGenreId(id)).called(1);
  });
  test("when updating genre that is not in database it must be inserted",
      () async {
    GenreModel genre = GenreModel(id: 1, name: "name");

    when(_genreDao.updateGenre(genre)).thenAnswer((_) => Future.value(0));
    when(_genreDao.insertGenre(genre)).thenAnswer((_) => Future.value(1));
    await databaseRepo.updateGenre(genre);

    verify(_genreDao.insertGenre(genre)).called(1);
  });
}
