import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';

class FavoriteEntity {
  final String? id;
  final double? rating;
  final String? imageUrl;

  FavoriteEntity({
    required this.id,
    required this.rating,
    required this.imageUrl,
  });

  MoviesEntity toMovieEntity() =>
      MoviesEntity(rating: rating, largeCoverImage: imageUrl, id: int.parse(id!));
}
