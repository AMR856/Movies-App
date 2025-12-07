import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';

class HistoryEntity {
  final int? id;
  final double? rating;
  final String? imageUrl;

  HistoryEntity({
    this.id,
    this.rating,
    this.imageUrl,
  });

  MoviesEntity toMovieEntity() => MoviesEntity(
    rating: rating,
    largeCoverImage: imageUrl,
    id: id,
  );
}
