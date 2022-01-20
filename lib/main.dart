import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies_cubit.dart';
import 'package:movies/movies_state.dart';

import 'package:movies/repository.dart';
import 'package:movies/screens/home_screen.dart';

import 'package:movies/screens/movie_details.dart';

void main() {
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
      home: BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(repository: MovieRepository()),
        child: Scaffold(body: HomeScreen()),
      ),
    );
  }
}
