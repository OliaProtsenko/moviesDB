import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/repository/database_repository.dart';
import 'package:movies/repository/database_repository_implementation.dart';
import 'package:movies/screens/home_screen.dart';

import 'home_screen_widget_test.mocks.dart';

@GenerateMocks([DatabaseRepositoryImplementation])
void main() {
  GetIt getIt = GetIt.instance;
  MockDatabaseRepositoryImplementation databaseRepo =
      MockDatabaseRepositoryImplementation();
  setUp(() {
    getIt.registerLazySingleton<DatabaseRepository>(() => databaseRepo);
  });
  testWidgets("HomeScreen should contain Search Field",
      (WidgetTester tester) async {
    List<GenreModel> genres = [GenreModel(id: 1, name: "genre1")];
    List<MovieModel> moviesForGenre = [
      MovieModel(
          id: 1,
          title: "movie1",
          imageUrl: null,
          backdropImageUrl: null,
          date: " ",
          overview: "overview1",
          rating: 9.0),
      MovieModel(
          id: 2,
          title: "movie2",
          imageUrl: null,
          backdropImageUrl: null,
          date: " ",
          overview: "overview2",
          rating: 9.0)
    ];

    when(databaseRepo.getAllGenres(false)).thenAnswer((_) {
      return Future.value(genres);
    });
    when(databaseRepo.getAllMoviesOfGenre(genres[0], false)).thenAnswer((_) {
      return Future.value(moviesForGenre);
    });
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    final hintTextFinder = find.text("Search");
    final searchIconFinder = find.byIcon(Icons.search);
    expect(hintTextFinder, findsOneWidget);
    expect(searchIconFinder, findsOneWidget);
  });
}
