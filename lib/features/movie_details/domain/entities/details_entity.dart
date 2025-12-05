import 'package:movies_app/features/movie_details/domain/entities/cast_entity.dart';

class DetailsEntity {
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
  final List<CastEntity> cast;
  final String? mediumScreenshotImage1;
  final String? mediumScreenshotImage2;
  final String? mediumScreenshotImage3;
  final String? largeScreenshotImage1;
  final String? largeScreenshotImage2;
  final String? largeScreenshotImage3;

  DetailsEntity({
    required this.id,
    required this.url,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.cast,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.largeScreenshotImage1,
    required this.largeScreenshotImage2,
    required this.largeScreenshotImage3,
  });
}
