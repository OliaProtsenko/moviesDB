import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movies/constants_for_widgets.dart';
import 'package:movies/cubits/actor_cubit.dart';
import 'package:movies/cubits/actor_state.dart';
import "package:movies/main.dart";
import 'package:movies/repository/database_repository.dart';
import 'package:movies/widgets/details_background.dart';
import 'package:movies/widgets/info_widgets.dart';
import 'package:movies/widgets/structure_info_widget.dart';

class ActorScreen extends StatelessWidget {
  const ActorScreen({Key? key, required this.actorId}) : super(key: key);
  final int actorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActorCubit>(
        create: (context) => ActorCubit(
            databaseRepository: getIt.get<DatabaseRepository>(),
            actorId: actorId),
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
                  Image.asset(
                    backgroundImage,
                    fit: BoxFit.fill,
                  ),
                  infoWidget(context: context, columnChildren: [
                    titleView(actor.name, context),
                    if (actor.dateOfBirth != null)
                      dateView(
                          DateFormat.yMMMMd('en_US')
                              .format(DateTime.parse(actor.dateOfBirth!)),
                          context),
                    if (actor.dateOfDeath != null)
                      dateView(
                          DateFormat.yMMMMd('en_US')
                              .format(DateTime.parse(actor.dateOfDeath!)),
                          context),
                    ratingView(actor.rating, context),
                  ], listChildren: [
                    overview("Biography", actor.biography!, context),
                  ]),
                  actor.imageUrl,
                  actor.id);
            }
            throw Exception();
          }),
        ));
  }
}
