import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@Entity(primaryKeys: ['id'])
@JsonSerializable()
class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  /// Connect the generated [_$MovieModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
