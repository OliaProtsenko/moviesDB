import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/constants.dart';

part 'movie_model.g.dart';

@entity
@JsonSerializable()
class MovieModel {
  MovieModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.backdropImageUrl,
    required this.date,
    required this.overview,
    required this.rating,
  });
  @primaryKey
  final int id;
  final String title;
  @JsonKey(name: 'poster_path', fromJson: _fullImageUrl)
  final String? imageUrl;
  @JsonKey(name: 'backdrop_path', fromJson: _fullImageUrl)
  final String? backdropImageUrl;
  @JsonKey(name: 'release_date')
  final String date;
  @JsonKey(name: 'vote_average')
  final double rating;
  String overview;
  static String? _fullImageUrl(String? part) {
    if (part != null) {
      return theMovieDbImageURL + part;
    } else {
      return null;
    }
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  /// Connect the generated [_$MovieModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
