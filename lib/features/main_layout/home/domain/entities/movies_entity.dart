class MoviesEntity {
  final int? id;
  final double? rating;
  final String? largeCoverImage;
  final String? year;
  final String? name;
  MoviesEntity({
    required this.rating,
    required this.largeCoverImage,
    required this.id,
    this.year,
    this.name,
  });
}
