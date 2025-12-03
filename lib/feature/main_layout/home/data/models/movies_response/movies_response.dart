import 'package:movies_app/feature/main_layout/home/data/models/movies_response/movies.dart';

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

// class Torrents {
//   String? url;
//   String? hash;
//   String? quality;
//   String? type;
//   String? isRepack;
//   String? videoCodec;
//   String? bitDepth;
//   String? audioChannels;
//   int? seeds;
//   int? peers;
//   String? size;
//   int? sizeBytes;
//   String? dateUploaded;
//   int? dateUploadedUnix;

//   Torrents({
//     this.url,
//     this.hash,
//     this.quality,
//     this.type,
//     this.isRepack,
//     this.videoCodec,
//     this.bitDepth,
//     this.audioChannels,
//     this.seeds,
//     this.peers,
//     this.size,
//     this.sizeBytes,
//     this.dateUploaded,
//     this.dateUploadedUnix,
//   });

//   Torrents.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     hash = json['hash'];
//     quality = json['quality'];
//     type = json['type'];
//     isRepack = json['is_repack'];
//     videoCodec = json['video_codec'];
//     bitDepth = json['bit_depth'];
//     audioChannels = json['audio_channels'];
//     seeds = json['seeds'];
//     peers = json['peers'];
//     size = json['size'];
//     sizeBytes = json['size_bytes'];
//     dateUploaded = json['date_uploaded'];
//     dateUploadedUnix = json['date_uploaded_unix'];
//   }
// }
