import 'package:movies_app/features/main_layout/profile/domain/entites/favorite_entity.dart';

class FavoriteData {
  FavoriteData({
    this.movieId,
    this.name,
    this.rating,
    this.imageURL,
    this.year,
  });

  FavoriteData.fromJson(dynamic json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = json['rating'];
    imageURL = json['imageURL'];
    year = json['year'];
  }

  String? movieId;
  String? name;
  double? rating;
  String? imageURL;
  String? year;

  FavoriteEntity toFavoriteEntity() => FavoriteEntity(
    id: movieId,
    rating: rating,
    imageUrl: imageURL,
  );


}
