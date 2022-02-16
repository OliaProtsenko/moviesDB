import 'package:floor/floor.dart';
import 'package:movies/models/actor_model.dart';
import 'package:movies/models/movie_model.dart';

@Entity(
  tableName: "ActorsForMovies",
  foreignKeys: [
    ForeignKey(
      childColumns: ['movie_id'],
      parentColumns: ['id'],
      entity: MovieModel,
    ),
    ForeignKey(
        childColumns: ['actor_id'], parentColumns: ['id'], entity: ActorModel)
  ],
)
class ActorsForMovies {
  ActorsForMovies({
    required this.id,
    required this.actorId,
    required this.movieId,
  });

  @PrimaryKey(autoGenerate: true)
  final int? id;
  @ColumnInfo(name: "movie_id")
  final int movieId;
  @ColumnInfo(name: "actor_id")
  final int actorId;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorsForMovies &&
          runtimeType == other.runtimeType &&
          movieId == other.movieId &&
          actorId == other.actorId;
  @override
  int get hashCode => id.hashCode ^ actorId.hashCode ^ movieId.hashCode;
}
