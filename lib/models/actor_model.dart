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

  final String id;
  final String name;
  final String gender;
  final String imageUrl;
  final double rating;
  final String? biography;
  final DateTime? dateOfBirth;
  final DateTime? dateOfDeath;
  final String? placeOfBirth;
}
