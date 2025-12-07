
import 'movies.dart';

class MoviesResponse {
  final String status;
  final String statusMessage;
  final Data data;

  MoviesResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final int movieCount;
  final int limit;
  final int pageNumber;
  final List<Movies> movies;

  Data({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      movieCount: json['movie_count'],
      limit: json['limit'],
      pageNumber: json['page_number'],
      movies: (json['movies'] as List<dynamic>)
          .map(
            (json) => Movies.fromJson(json),
          )
          .toList(),
    );
  }
}