import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';

class Movies {
  final int? id;
  final String? url;
  final String? imdbCode;
  final String? title;
  final String? titleEnglish;
  final String? titleLong;
  final int? year;
  final List<String>? genres;
  final String? summary;
  final String? slug;
  final double? rating;
  final int? runtime;
  final String? descriptionFull;
  final String? synopsis;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String? state;
  // final List<Torrents>? torrents;
  final String? dateUploaded;
  final int? dateUploadedUnix;

  Movies({
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
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.state,
    // this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'],
      url: json['url'],
      imdbCode: json['imdb_code'],
      title: json['title'],
      titleEnglish: json['title_english'],
      titleLong: json['title_long'],
      slug: json['slug'],
      year: json['year'],
      rating: json['rating']?.toDouble(),
      runtime: json['runtime'],
      genres: json['genres'] != null ? List<String>.from(json['genres']) : null,
      summary: json['summary'],
      descriptionFull: json['description_full'],
      synopsis: json['synopsis'],
      ytTrailerCode: json['yt_trailer_code'],
      language: json['language'],
      mpaRating: json['mpa_rating'],
      backgroundImage: json['background_image'],
      backgroundImageOriginal: json['background_image_original'],
      smallCoverImage: json['small_cover_image'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'],
      state: json['state'],
      // torrents: json['torrents'] != null
      //   ? (json['torrents'] as List<dynamic>)
      //       .map((v) => Torrents.fromJson(v))
      //       .toList()
      //   : null,
      dateUploaded: json['date_uploaded'],
      dateUploadedUnix: json['date_uploaded_unix'],
    );
  }

  MoviesEntity toMoviesEntity() => MoviesEntity(
    id: id,
    rating: rating,
    largeCoverImage: largeCoverImage,
  );
}
