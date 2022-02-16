import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies/constants.dart';

part 'actor_model.g.dart';

@entity
@JsonSerializable()
class ActorModel {
  ActorModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.imageUrl,
    this.biography,
    this.dateOfBirth,
    this.dateOfDeath,
    this.placeOfBirth,
    required this.rating,
  });
  @primaryKey
  final int id;
  final String name;
  @JsonKey(fromJson: _gender)
  final String gender;
  @JsonKey(name: 'profile_path', fromJson: _fullImageUrl)
  final String? imageUrl;
  @JsonKey(name: 'popularity')
  final double rating;
  final String? biography;
  @JsonKey(name: 'birthday')
  final String? dateOfBirth;
  @JsonKey(name: 'deathday')
  final String? dateOfDeath;
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  static String? _fullImageUrl(String? part) {
    if (part != null) {
      return theMovieDbImageURL + part;
    } else {
      return null;
    }
  }

  static String _gender(int gender) {
    return (gender == 1) ? "woman" : "man";
  }

  factory ActorModel.fromJson(Map<String, dynamic> json) =>
      _$ActorModelFromJson(json);

  /// Connect the generated [_$MovieModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActorModelToJson(this);
}
