import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/cubits/actor_cubit.dart';
import 'package:movies/cubits/actor_state.dart';
import 'package:movies/models/actor_model.dart';
import 'package:movies/repository.dart';
import 'package:movies/widgets/details_background.dart';
import 'package:movies/widgets/structure_info_widget.dart';
import 'package:movies/widgets/info_widgets.dart';
import 'package:intl/intl.dart';

class ActorScreen extends StatelessWidget {
  const ActorScreen({Key? key, required this.actorId}) : super(key: key);
  final String actorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActorCubit>(
        create: (context) =>
            ActorCubit(repository: MovieRepository(), actorId: actorId),
        child: Scaffold(
          body: BlocBuilder<ActorCubit, ActorState>(builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return const Center(
                child: Icon(Icons.close),
              );
            } else if (state is LoadedState) {
              final actor = state.actor;
              return detailsBackground(
                  Image.asset('assets/dark-blue-blurred-background.jpg',
                      fit: BoxFit.fill),
                  infoWidget(columnChildren: [
                    titleView(actor.name),
                    dateView(
                        DateFormat.yMMMMd('en_US').format(actor.dateOfBirth!)),
                    if (actor.dateOfDeath != null)
                      dateView(DateFormat.yMMMMd('en_US')
                          .format(actor.dateOfDeath!)),

                    ratingView(actor.rating),
                  ], listChildren: [
                    overview("Biography", actor.biography!),

                  ]),
                  actor.imageUrl);
            }
            throw Exception();
          }),
        ));
  }
}
