import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/one_movie_cubit.dart';
import 'package:movies/cubits/one_movie_state.dart';
import 'package:movies/main.dart';
import 'package:movies/models/actor_model.dart';
import 'package:movies/repository/database_repository.dart';
import 'package:movies/screens/actor_screen.dart';

class ActorsForMovieView extends StatelessWidget {
  const ActorsForMovieView({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OneMovieCubit>(
        create: (context) => OneMovieCubit(
            databaseRepository: getIt.get<DatabaseRepository>(),
            movieId: movieId),
        child: BlocBuilder<OneMovieCubit, OneMovieState>(
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
            final actors = state.actors;
            return SizedBox(
              height: 200.0,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: actors.length,
                  itemBuilder: (context, i) {
                    return actorIcon(actors[i], context);
                  }),
            );
          }
          throw Exception();
        }));
  }

  Widget actorIcon(ActorModel actor, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 8.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: actor.id,
            child: Material(
              shape: const CircleBorder(),
              child: InkWell(
                child: (actor.imageUrl == null)
                    ? const Icon(Icons.add_a_photo)
                    : CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(actor.imageUrl!),
                      ),
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 2),
                      pageBuilder: (_, __, ___) =>
                          ActorScreen(actorId: actor.id)));
                },
              ),
            ),
          ),
          Text(actor.name)
        ],
      ),
    );
  }
}
