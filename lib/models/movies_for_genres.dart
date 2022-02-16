import 'package:floor/floor.dart';
import 'package:movies/models/genre_model.dart';
import 'package:movies/models/movie_model.dart';

@Entity(
  foreignKeys: [
    ForeignKey(
      childColumns: ['movieId'],
      parentColumns: ['id'],
      entity: MovieModel,
    ),
    ForeignKey(
        childColumns: ['genreId'], parentColumns: ['id'], entity: GenreModel)
  ],
)
class MoviesForGenres {
  MoviesForGenres({this.id, required this.genreId, required this.movieId});

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int movieId;
  final int genreId;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesForGenres &&
          runtimeType == other.runtimeType &&
          movieId == other.movieId &&
          genreId == other.genreId;
  @override
  int get hashCode => id.hashCode ^ genreId.hashCode ^ movieId.hashCode;
}
