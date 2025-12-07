import 'package:movies_app/features/movie_details/domain/entities/movie_suggestion_entity.dart';

class MovieSuggestions {

  double? rating;
  String? mediumCoverImage;



  MovieSuggestions({
 
    this.rating,
    this.mediumCoverImage

  });

  MovieSuggestions.fromJson(Map<String, dynamic> json) {

    rating = json['rating'];
   
    mediumCoverImage = json['medium_cover_image'];
  }
  MovieSuggestionEntity toMovieSuggestionEntity() =>
      MovieSuggestionEntity(mediumCoverImage: mediumCoverImage, rating: rating);
}
