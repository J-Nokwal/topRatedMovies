import 'dart:convert';

import 'package:http/http.dart';
import 'package:posiblesoftwareinterntest/model/api_key.dart';
import 'package:posiblesoftwareinterntest/model/serialization.dart';
import 'package:posiblesoftwareinterntest/model/serializationofVideo.dart';

class ApiDataSource {
  final String _searchBaseUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$API_KEY&language=en-US&page=1';
  Future<VideosDetails> searchVideos() async {
    final urlRaw = _searchBaseUrl;
    print(urlRaw);
    final urlEncoded = Uri.encodeFull(urlRaw);
    final uri = Uri.parse(urlEncoded);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      // print(response.body);
      return videosDetailsFromJson(response.body);
    } else {
      print(
          "Error in ApiDataSource with statuscode: ${response.statusCode} \n");
      throw ApiSearchError(jsonDecode(response.body));
    }
  }

  Future<VideosPlay> getVideoYouTubeId({required int id}) async {
    final urlRaw =
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=$API_KEY';
    print(urlRaw);
    final urlEncoded = Uri.encodeFull(urlRaw);
    final uri = Uri.parse(urlEncoded);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      // print(response.body);
      return videosPlayFromJson(response.body);
    } else {
      print(
          "Error in ApiDataSource with statuscode: ${response.statusCode} \n");
      throw VideoPlayNetworkError(jsonDecode(response.body));
    }
  }
}

class ApiSearchError implements Exception {
  final String message;
  ApiSearchError(this.message);
}

class VideoPlayNetworkError implements Exception {
  final String message;
  VideoPlayNetworkError(this.message);
}
