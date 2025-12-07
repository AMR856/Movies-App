import 'package:movies_app/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/details_entity.dart';

class Details {
  final int? id;
  final String? url;
  final String? title;
  final String? titleEnglish;
  final String? titleLong;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final int? likeCount;
  final String? descriptionIntro;
  final String? descriptionFull;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String? mediumScreenshotImage1;
  final String? mediumScreenshotImage2;
  final String? mediumScreenshotImage3;
  final String? largeScreenshotImage1;
  final String? largeScreenshotImage2;
  final String? largeScreenshotImage3;
  final String? slug;
  final String? imdbCode;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? dateUploaded;
  final int? dateUploadedUnix;
  final List<Cast>? cast;

  Details({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.dateUploaded,
    required this.dateUploadedUnix,
    required this.cast,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.largeScreenshotImage1,
    required this.largeScreenshotImage2,
    required this.largeScreenshotImage3,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['id'],
      url: json['url'],
      imdbCode: json['imdb_code'],
      title: json['title'],
      titleEnglish: json['title_english'],
      titleLong: json['title_long'],
      slug: json['slug'],
      year: json['year'],
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: json['runtime'],
      genres: json['genres'] != null ? List<String>.from(json['genres']) : null,
      likeCount: json['like_count'],
      descriptionIntro: json['description_intro'],
      descriptionFull: json['description_full'],
      ytTrailerCode: json['yt_trailer_code'],
      language: json['language'],
      mpaRating: json['mpa_rating'],
      backgroundImage: json['background_image'],
      backgroundImageOriginal: json['background_image_original'],
      smallCoverImage: json['small_cover_image'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'],
      dateUploaded: json['date_uploaded'],
      dateUploadedUnix: json['date_uploaded_unix'],
      cast: json['cast'] != null
          ? (json['cast'] as List<dynamic>)
                .map((castJson) => Cast.fromJson(castJson))
                .toList()
          : <Cast>[],
      mediumScreenshotImage1: json['medium_screenshot_image1'],
      mediumScreenshotImage2: json['medium_screenshot_image2'],
      mediumScreenshotImage3: json['medium_screenshot_image3'],
      largeScreenshotImage1: json['large_screenshot_image1'],
      largeScreenshotImage2: json['large_screenshot_image2'],
      largeScreenshotImage3: json['large_screenshot_image3'],
    );
  }

  DetailsEntity toDetailsEntity() => DetailsEntity(
    id: id,
    url: url,
    title: title,
    titleEnglish: titleEnglish,
    titleLong: titleLong,
    year: year,
    rating: rating,
    runtime: runtime,
    genres: genres,
    likeCount: likeCount,
    descriptionIntro: descriptionIntro,
    descriptionFull: descriptionFull,
    backgroundImage: backgroundImage,
    backgroundImageOriginal: backgroundImageOriginal,
    smallCoverImage: smallCoverImage,
    mediumCoverImage: mediumCoverImage,
    largeCoverImage: largeCoverImage,
    cast: cast?.map((c) => c.toCastEntity()).toList() ?? [],
    largeScreenshotImage1: largeScreenshotImage1,
    largeScreenshotImage2: largeScreenshotImage2,
    largeScreenshotImage3: largeScreenshotImage3,
    mediumScreenshotImage1: mediumScreenshotImage1,
    mediumScreenshotImage2: mediumScreenshotImage2,
    mediumScreenshotImage3: mediumScreenshotImage3,
  );
}

class Cast {
  final String name;
  final String characterName;
  final String urlSmallImage;

  Cast({
    required this.name,
    required this.characterName,
    required this.urlSmallImage,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'],
      characterName: json['character_name'],
      urlSmallImage: json['url_small_image'],
    );
  }
  CastEntity toCastEntity() => CastEntity(
    name: name,
    characterName: characterName,
    urlSmallImage: urlSmallImage,
  );
}
