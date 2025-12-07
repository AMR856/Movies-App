import 'favorite_data.dart';

class FavoriteResponse {
  FavoriteResponse({
      this.message, 
      this.data,});

  FavoriteResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavoriteData.fromJson(v));
      });
    }
  }
  String? message;
  List<FavoriteData>? data;


}