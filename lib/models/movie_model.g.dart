// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: MovieModel._fullImageUrl(json['poster_path'] as String?),
      backdropImageUrl:
          MovieModel._fullImageUrl(json['backdrop_path'] as String?),
      date: json['release_date'] as String,
      overview: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.imageUrl,
      'backdrop_path': instance.backdropImageUrl,
      'release_date': instance.date,
      'vote_average': instance.rating,
      'overview': instance.overview,
    };
