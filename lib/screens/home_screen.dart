import 'package:flutter/material.dart';
import 'package:movies/cubits/movies_cubit.dart';
import 'package:movies/cubits/movies_state.dart';
import 'package:movies/models/movie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/repository.dart';
import 'package:movies/screens/movie_details.dart';
import 'package:movies/widgets/home_screen_background.dart';
import '../models/genre_model.dart';
import 'package:movies/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesCubit>(
        create: (context) =>
            MoviesCubit(repository: getIt.get<MovieRepository>()),
        child: Scaffold(
            body: HomeBackground(
                backgroundImage: Image.asset(
                  'assets/dark-blue-blurred-background.jpg',
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                child: BlocBuilder<MoviesCubit, MoviesState>(
                    builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ErrorState) {
                    return const Center(
                      child: Icon(Icons.close),
                    );
                  } else if (state is LoadedState) {
                    final movies = state.movies;
                    return ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, i) {
                          GenreModel key = movies.keys.elementAt(i);
                          return listMoviesOfGenre(key, context, movies[key]!);
                        });
                  }
                  throw Exception();
                }))));
  }
}

Widget listMoviesOfGenre(
    GenreModel genre, BuildContext context, List<MovieModel> movies) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(genre.name, style: Theme.of(context).textTheme.headline2),
      ),
      SizedBox(
        child: ListView.builder(
            itemCount: (movies.isEmpty) ? 0 : 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return IconButton(
                  icon: (movies[index].imageUrl != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: ColorFiltered(
                            child: Image.network(
                              movies[index].imageUrl!,
                            ),
                            colorFilter: ColorFilter.mode(
                                Colors.white10,
                                (Theme.of(context).brightness ==
                                        Brightness.light)
                                    ? BlendMode.lighten
                                    : BlendMode.darken),
                          ))
                      : const Icon(Icons.downloading),
                  iconSize: 150,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              MovieDetails(movie: movies[index])),
                    );
                  });
            }),
        height: 300.0,
      ),
    ],
  );
}
