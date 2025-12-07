import 'package:movies_app/features/movie_details/data/models/movie_suggestion.dart';

class MovieSuggestionsResponse {
  final String? status;
  final String? statusMessage;
  final Data? data;

  MovieSuggestionsResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory MovieSuggestionsResponse.fromJson(Map<String, dynamic> json) {
    return MovieSuggestionsResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final int? movieCount;
  final List<MovieSuggestions>? movies;

  Data({required this.movieCount, required this.movies});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      movieCount: json['movie_count'],
      movies: (json['movies'] as List<dynamic>)
          .map(
            (json) => MovieSuggestions.fromJson(json),
          )
          .toList(),
    );
  }
}

