import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/database.dart';
import 'package:movies/repository/database_repository.dart';
import 'package:movies/repository/database_repository_implementation.dart';
import 'package:movies/repository/http_repository.dart';
import 'package:movies/repository/repository.dart';
import 'package:movies/screens/home_screen.dart';
import 'package:movies/widgets/app_theme.dart';

GetIt getIt = GetIt.instance;

Future<void> main() async {
  getIt.registerLazySingleton<MovieRepository>(() => HttpMovieRepository());
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  getIt.registerLazySingleton<DatabaseRepository>(
      () => DatabaseRepositoryImplementation(
            database: database,
            httpRepository: getIt.get<MovieRepository>(),
          ));
  // databaseRepository: DatabaseRepository(database: database)));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
