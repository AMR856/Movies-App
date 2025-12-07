import 'package:movies_app/features/movie_details/data/models/details.dart';

class DetailsResponse {
  final String? status;
  final String? statusMessage;
  final Data? data;

  DetailsResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });
  factory DetailsResponse.fromJson(Map<String, dynamic> json) {
    return DetailsResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final Details? movie;
  Data({required this.movie});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(movie: Details.fromJson(json['movie']));
  }
}
