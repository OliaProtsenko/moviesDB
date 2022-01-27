import 'package:flutter/material.dart';
import 'package:movies/repository.dart';
import 'package:movies/screens/home_screen.dart';
import 'package:movies/widgets/app_theme.dart';
import 'package:get_it/get_it.dart';
GetIt getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton<MovieRepository>(
          () => HttpMovieRepository());


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
