class DeleteFavoriteResponse {
  final String? message;
  final bool? data;

  DeleteFavoriteResponse({this.message, this.data});

  factory DeleteFavoriteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFavoriteResponse(
      message: json['message'],
    );
  }
}
