import 'data.dart';

class AddFavoriteResponse {
  AddFavoriteResponse({
      this.message, 
      this.data,});

  AddFavoriteResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

}