import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/models/movie_mode.dart';
import 'package:movie_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MoveModel>> getTranding();
  Future<List<MoveModel>> getPopular();
  Future<List<MoveModel>> getComingSoon();
  Future<List<MoveModel>> getPlayingNow();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MoveModel>> getTranding() async {
    final response = await _client.get("trending/movie/week");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    print("====================");
    return movies;
  }

  @override
  Future<List<MoveModel>> getPopular() async {
    final response = await _client.get("movie/popular");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MoveModel>> getComingSoon()async {
     final response = await _client.get("movie/upcoming");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MoveModel>> getPlayingNow()async {
      final response = await _client.get("movie/now_playing");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}
