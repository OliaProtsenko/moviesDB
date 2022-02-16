// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorModel _$ActorModelFromJson(Map<String, dynamic> json) => ActorModel(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: ActorModel._gender(json['gender'] as int),
      imageUrl: ActorModel._fullImageUrl(json['profile_path'] as String?),
      biography: json['biography'] as String?,
      dateOfBirth: json['birthday'] as String?,
      dateOfDeath: json['deathday'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      rating: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$ActorModelToJson(ActorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'profile_path': instance.imageUrl,
      'popularity': instance.rating,
      'biography': instance.biography,
      'birthday': instance.dateOfBirth,
      'deathday': instance.dateOfDeath,
      'place_of_birth': instance.placeOfBirth,
    };
