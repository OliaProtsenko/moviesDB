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

  final String id;
  final String title;
  final String? imageUrl;
  final String? backdropImageUrl;
  final String date;
  final double rating;
  String overview;
}
