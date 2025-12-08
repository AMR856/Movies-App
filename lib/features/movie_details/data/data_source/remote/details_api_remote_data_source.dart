import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/prefs/prefs_manager.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/features/movie_details/data/data_source/remote/details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/data/models/Is_movie_favorite_response.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_request.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_response.dart';
import 'package:movies_app/features/movie_details/data/models/delete_favorite_response.dart';
import 'package:movies_app/features/movie_details/data/models/details_response.dart';
import 'package:movies_app/features/movie_details/data/models/movie_suggestions_response.dart';

@Singleton(as: DetailsRemoteDataSource)
class DetailsApiRemoteDataSource implements DetailsRemoteDataSource {
  late final Dio dio;

  DetailsApiRemoteDataSource() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseURL,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${PrefsManager.getToken()}',
        },
      ),
    );
  }

  @override
  Future<DetailsResponse> getDetailsMovie(int? movieId) async {
    try {
      final response = await dio.get(
        ApiConstant.movieDetailsEndPoint,
        queryParameters: {
          'movie_id': movieId,
          'with_cast': true,
          'with_images': true,
        },
      );
      return DetailsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'] ?? exception.message;
      }
      throw RemoteException(message: message ?? 'Failed to get Details Movies');
    }
  }

  @override
  Future<MovieSuggestionsResponse> getMovieSuggestions(int? movieId) async {
    try {
      final response = await dio.get(
        ApiConstant.movieSuggestionsEndPoint,
        queryParameters: {'movie_id': movieId},
      );
      return MovieSuggestionsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'] ?? exception.message;
      }
      throw RemoteException(message: message ?? 'Failed to get Movies Genres');
    }
  }

  @override
  Future<AddFavoriteResponse> addToFavorites(AddFavoriteRequest request) async {
    try {
      final response = await dio.post(
        '${ApiConstant.routeBaseURL}favorites/add',
        data: request.toJson(),
      );
      return AddFavoriteResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'] ?? exception.message;
      }
      throw RemoteException(message: message ?? 'Failed to add favorite');
    }
  }

  @override
  Future<IsMovieFavoriteResponse> isFavorite(String movieId) async {
    final url = Uri.parse(
      '${ApiConstant.routeBaseURL}favorites/is-favorite/$movieId',
    );
    final token = PrefsManager.getToken();

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return IsMovieFavoriteResponse.fromJson(jsonData);
      } else {
        final jsonData = json.decode(response.body);
        throw RemoteException(
          message: jsonData['message'] ?? 'Failed to fetch favorite status',
        );
      }
    } catch (e) {
      throw RemoteException(message: e.toString());
    }
  }

  @override
  Future<DeleteFavoriteResponse> deleteFavorite(String movieId) async {
    final url = Uri.parse(
      '${ApiConstant.routeBaseURL}favorites/remove/$movieId',
    );
    final token = PrefsManager.getToken();

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return DeleteFavoriteResponse.fromJson(jsonData);
      } else {
        final jsonData = json.decode(response.body);
        throw RemoteException(
          message: jsonData['message'] ?? 'Failed to fetch favorite status',
        );
      }
    } catch (e) {
      throw RemoteException(message: e.toString());
    }
  }
}
