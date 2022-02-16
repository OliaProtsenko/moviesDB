// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ActorDao? _actorDaoInstance;

  MovieDao? _movieDaoInstance;

  GenreDao? _genreDaoInstance;

  ActorsForMoviesDao? _actorsForMoviesDaoInstance;

  MoviesForGenresDao? _moviesForGenresDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ActorModel` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `gender` TEXT NOT NULL, `imageUrl` TEXT, `rating` REAL NOT NULL, `biography` TEXT, `dateOfBirth` TEXT, `dateOfDeath` TEXT, `placeOfBirth` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MovieModel` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `imageUrl` TEXT, `backdropImageUrl` TEXT, `date` TEXT NOT NULL, `rating` REAL NOT NULL, `overview` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GenreModel` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ActorsForMovies` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `movie_id` INTEGER NOT NULL, `actor_id` INTEGER NOT NULL, FOREIGN KEY (`movie_id`) REFERENCES `MovieModel` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`actor_id`) REFERENCES `ActorModel` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MoviesForGenres` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `movieId` INTEGER NOT NULL, `genreId` INTEGER NOT NULL, FOREIGN KEY (`movieId`) REFERENCES `MovieModel` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`genreId`) REFERENCES `GenreModel` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ActorDao get actorDao {
    return _actorDaoInstance ??= _$ActorDao(database, changeListener);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }

  @override
  GenreDao get genreDao {
    return _genreDaoInstance ??= _$GenreDao(database, changeListener);
  }

  @override
  ActorsForMoviesDao get actorsForMoviesDao {
    return _actorsForMoviesDaoInstance ??=
        _$ActorsForMoviesDao(database, changeListener);
  }

  @override
  MoviesForGenresDao get moviesForGenresDao {
    return _moviesForGenresDaoInstance ??=
        _$MoviesForGenresDao(database, changeListener);
  }
}

class _$ActorDao extends ActorDao {
  _$ActorDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _actorModelInsertionAdapter = InsertionAdapter(
            database,
            'ActorModel',
            (ActorModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'gender': item.gender,
                  'imageUrl': item.imageUrl,
                  'rating': item.rating,
                  'biography': item.biography,
                  'dateOfBirth': item.dateOfBirth,
                  'dateOfDeath': item.dateOfDeath,
                  'placeOfBirth': item.placeOfBirth
                }),
        _actorModelUpdateAdapter = UpdateAdapter(
            database,
            'ActorModel',
            ['id'],
            (ActorModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'gender': item.gender,
                  'imageUrl': item.imageUrl,
                  'rating': item.rating,
                  'biography': item.biography,
                  'dateOfBirth': item.dateOfBirth,
                  'dateOfDeath': item.dateOfDeath,
                  'placeOfBirth': item.placeOfBirth
                }),
        _actorModelDeletionAdapter = DeletionAdapter(
            database,
            'ActorModel',
            ['id'],
            (ActorModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'gender': item.gender,
                  'imageUrl': item.imageUrl,
                  'rating': item.rating,
                  'biography': item.biography,
                  'dateOfBirth': item.dateOfBirth,
                  'dateOfDeath': item.dateOfDeath,
                  'placeOfBirth': item.placeOfBirth
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ActorModel> _actorModelInsertionAdapter;

  final UpdateAdapter<ActorModel> _actorModelUpdateAdapter;

  final DeletionAdapter<ActorModel> _actorModelDeletionAdapter;

  @override
  Future<List<ActorModel>?> getAllRecords() async {
    return _queryAdapter.queryList('SELECT* FROM ActorModel',
        mapper: (Map<String, Object?> row) => ActorModel(
            id: row['id'] as int,
            name: row['name'] as String,
            gender: row['gender'] as String,
            imageUrl: row['imageUrl'] as String?,
            biography: row['biography'] as String?,
            dateOfBirth: row['dateOfBirth'] as String?,
            dateOfDeath: row['dateOfDeath'] as String?,
            placeOfBirth: row['placeOfBirth'] as String?,
            rating: row['rating'] as double));
  }

  @override
  Future<ActorModel?> findActorById(int id) async {
    return _queryAdapter.query('SELECT*FROM ActorModel WHERE id =?1',
        mapper: (Map<String, Object?> row) => ActorModel(
            id: row['id'] as int,
            name: row['name'] as String,
            gender: row['gender'] as String,
            imageUrl: row['imageUrl'] as String?,
            biography: row['biography'] as String?,
            dateOfBirth: row['dateOfBirth'] as String?,
            dateOfDeath: row['dateOfDeath'] as String?,
            placeOfBirth: row['placeOfBirth'] as String?,
            rating: row['rating'] as double),
        arguments: [id]);
  }

  @override
  Future<int> insertActor(ActorModel actor) {
    return _actorModelInsertionAdapter.insertAndReturnId(
        actor, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateActor(ActorModel actor) {
    return _actorModelUpdateAdapter.updateAndReturnChangedRows(
        actor, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteActor(ActorModel actor) async {
    await _actorModelDeletionAdapter.delete(actor);
  }

  @override
  Future<int> deleteActors(List<ActorModel> actors) {
    return _actorModelDeletionAdapter.deleteListAndReturnChangedRows(actors);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _movieModelInsertionAdapter = InsertionAdapter(
            database,
            'MovieModel',
            (MovieModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'imageUrl': item.imageUrl,
                  'backdropImageUrl': item.backdropImageUrl,
                  'date': item.date,
                  'rating': item.rating,
                  'overview': item.overview
                }),
        _movieModelUpdateAdapter = UpdateAdapter(
            database,
            'MovieModel',
            ['id'],
            (MovieModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'imageUrl': item.imageUrl,
                  'backdropImageUrl': item.backdropImageUrl,
                  'date': item.date,
                  'rating': item.rating,
                  'overview': item.overview
                }),
        _movieModelDeletionAdapter = DeletionAdapter(
            database,
            'MovieModel',
            ['id'],
            (MovieModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'imageUrl': item.imageUrl,
                  'backdropImageUrl': item.backdropImageUrl,
                  'date': item.date,
                  'rating': item.rating,
                  'overview': item.overview
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieModel> _movieModelInsertionAdapter;

  final UpdateAdapter<MovieModel> _movieModelUpdateAdapter;

  final DeletionAdapter<MovieModel> _movieModelDeletionAdapter;

  @override
  Future<List<MovieModel>?> getAllRecords() async {
    return _queryAdapter.queryList('SELECT* FROM MovieModel',
        mapper: (Map<String, Object?> row) => MovieModel(
            id: row['id'] as int,
            title: row['title'] as String,
            imageUrl: row['imageUrl'] as String?,
            backdropImageUrl: row['backdropImageUrl'] as String?,
            date: row['date'] as String,
            overview: row['overview'] as String,
            rating: row['rating'] as double));
  }

  @override
  Future<MovieModel?> findMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM MovieModel WHERE id =?1',
        mapper: (Map<String, Object?> row) => MovieModel(
            id: row['id'] as int,
            title: row['title'] as String,
            imageUrl: row['imageUrl'] as String?,
            backdropImageUrl: row['backdropImageUrl'] as String?,
            date: row['date'] as String,
            overview: row['overview'] as String,
            rating: row['rating'] as double),
        arguments: [id]);
  }

  @override
  Future<MovieModel?> findMovieByTitle(String title) async {
    return _queryAdapter.query('SELECT * FROM MovieModel WHERE title =?1',
        mapper: (Map<String, Object?> row) => MovieModel(
            id: row['id'] as int,
            title: row['title'] as String,
            imageUrl: row['imageUrl'] as String?,
            backdropImageUrl: row['backdropImageUrl'] as String?,
            date: row['date'] as String,
            overview: row['overview'] as String,
            rating: row['rating'] as double),
        arguments: [title]);
  }

  @override
  Future<int> insertMovie(MovieModel movie) {
    return _movieModelInsertionAdapter.insertAndReturnId(
        movie, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateMovie(MovieModel movie) {
    return _movieModelUpdateAdapter.updateAndReturnChangedRows(
        movie, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteMovie(MovieModel movie) async {
    await _movieModelDeletionAdapter.delete(movie);
  }

  @override
  Future<int> deleteActors(List<MovieModel> movies) {
    return _movieModelDeletionAdapter.deleteListAndReturnChangedRows(movies);
  }
}

class _$GenreDao extends GenreDao {
  _$GenreDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _genreModelInsertionAdapter = InsertionAdapter(
            database,
            'GenreModel',
            (GenreModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _genreModelUpdateAdapter = UpdateAdapter(
            database,
            'GenreModel',
            ['id'],
            (GenreModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _genreModelDeletionAdapter = DeletionAdapter(
            database,
            'GenreModel',
            ['id'],
            (GenreModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GenreModel> _genreModelInsertionAdapter;

  final UpdateAdapter<GenreModel> _genreModelUpdateAdapter;

  final DeletionAdapter<GenreModel> _genreModelDeletionAdapter;

  @override
  Future<List<GenreModel>?> getAllRecords() async {
    return _queryAdapter.queryList('SELECT DISTINCT * FROM GenreModel',
        mapper: (Map<String, Object?> row) =>
            GenreModel(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<GenreModel?> findGenreById(int id) async {
    return _queryAdapter.query('SELECT*FROM GenreModel WHERE id =?1',
        mapper: (Map<String, Object?> row) =>
            GenreModel(id: row['id'] as int, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<GenreModel?> findGenreByName(String name) async {
    return _queryAdapter.query('SELECT*FROM GenreModel WHERE name =?1',
        mapper: (Map<String, Object?> row) =>
            GenreModel(id: row['id'] as int, name: row['name'] as String),
        arguments: [name]);
  }

  @override
  Future<int> insertGenre(GenreModel actor) {
    return _genreModelInsertionAdapter.insertAndReturnId(
        actor, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateGenre(GenreModel genre) {
    return _genreModelUpdateAdapter.updateAndReturnChangedRows(
        genre, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteGenre(GenreModel genre) async {
    await _genreModelDeletionAdapter.delete(genre);
  }

  @override
  Future<int> deleteGenres(List<GenreModel> genre) {
    return _genreModelDeletionAdapter.deleteListAndReturnChangedRows(genre);
  }
}

class _$ActorsForMoviesDao extends ActorsForMoviesDao {
  _$ActorsForMoviesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _actorsForMoviesInsertionAdapter = InsertionAdapter(
            database,
            'ActorsForMovies',
            (ActorsForMovies item) => <String, Object?>{
                  'id': item.id,
                  'movie_id': item.movieId,
                  'actor_id': item.actorId
                }),
        _actorsForMoviesDeletionAdapter = DeletionAdapter(
            database,
            'ActorsForMovies',
            ['id'],
            (ActorsForMovies item) => <String, Object?>{
                  'id': item.id,
                  'movie_id': item.movieId,
                  'actor_id': item.actorId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ActorsForMovies> _actorsForMoviesInsertionAdapter;

  final DeletionAdapter<ActorsForMovies> _actorsForMoviesDeletionAdapter;

  @override
  Future<List<ActorsForMovies>?> getAllRecords() async {
    return _queryAdapter.queryList('SELECT* FROM ActorsForMovies',
        mapper: (Map<String, Object?> row) => ActorsForMovies(
            id: row['id'] as int?,
            actorId: row['actor_id'] as int,
            movieId: row['movie_id'] as int));
  }

  @override
  Future<List<ActorsForMovies>?> findByActorId(int id) async {
    return _queryAdapter.queryList(
        'SELECT*FROM ActorsForMovies WHERE actor_id =?1',
        mapper: (Map<String, Object?> row) => ActorsForMovies(
            id: row['id'] as int?,
            actorId: row['actor_id'] as int,
            movieId: row['movie_id'] as int),
        arguments: [id]);
  }

  @override
  Future<List<ActorsForMovies>?> findByMovieId(int id) async {
    return _queryAdapter.queryList(
        'SELECT*FROM ActorsForMovies WHERE movie_id =?1',
        mapper: (Map<String, Object?> row) => ActorsForMovies(
            id: row['id'] as int?,
            actorId: row['actor_id'] as int,
            movieId: row['movie_id'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertActorsForMovies(ActorsForMovies actor) async {
    await _actorsForMoviesInsertionAdapter.insert(
        actor, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteActorForMovie(ActorsForMovies actorForMovie) async {
    await _actorsForMoviesDeletionAdapter.delete(actorForMovie);
  }

  @override
  Future<int> deleteActorsForMovies(List<ActorsForMovies> actorsForMovies) {
    return _actorsForMoviesDeletionAdapter
        .deleteListAndReturnChangedRows(actorsForMovies);
  }
}

class _$MoviesForGenresDao extends MoviesForGenresDao {
  _$MoviesForGenresDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _moviesForGenresInsertionAdapter = InsertionAdapter(
            database,
            'MoviesForGenres',
            (MoviesForGenres item) => <String, Object?>{
                  'id': item.id,
                  'movieId': item.movieId,
                  'genreId': item.genreId
                }),
        _moviesForGenresDeletionAdapter = DeletionAdapter(
            database,
            'MoviesForGenres',
            ['id'],
            (MoviesForGenres item) => <String, Object?>{
                  'id': item.id,
                  'movieId': item.movieId,
                  'genreId': item.genreId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MoviesForGenres> _moviesForGenresInsertionAdapter;

  final DeletionAdapter<MoviesForGenres> _moviesForGenresDeletionAdapter;

  @override
  Future<List<MoviesForGenres>?> getAllRecords() async {
    return _queryAdapter.queryList('SELECT* FROM MoviesForGenres',
        mapper: (Map<String, Object?> row) => MoviesForGenres(
            id: row['id'] as int?,
            genreId: row['genreId'] as int,
            movieId: row['movieId'] as int));
  }

  @override
  Future<List<MoviesForGenres>?> findByGenreId(int id) async {
    return _queryAdapter.queryList(
        'SELECT*FROM MoviesForGenres WHERE genreId =?1',
        mapper: (Map<String, Object?> row) => MoviesForGenres(
            id: row['id'] as int?,
            genreId: row['genreId'] as int,
            movieId: row['movieId'] as int),
        arguments: [id]);
  }

  @override
  Future<List<MoviesForGenres>?> findByMovieId(int id) async {
    return _queryAdapter.queryList(
        'SELECT*FROM MoviesForGenres WHERE movieId =?1',
        mapper: (Map<String, Object?> row) => MoviesForGenres(
            id: row['id'] as int?,
            genreId: row['genreId'] as int,
            movieId: row['movieId'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertMoviesForGenres(MoviesForGenres actor) async {
    await _moviesForGenresInsertionAdapter.insert(
        actor, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMovieForGenre(MoviesForGenres movieForGenre) async {
    await _moviesForGenresDeletionAdapter.delete(movieForGenre);
  }

  @override
  Future<int> deleteMoviesForGenres(List<MoviesForGenres> moviesForGenres) {
    return _moviesForGenresDeletionAdapter
        .deleteListAndReturnChangedRows(moviesForGenres);
  }
}
