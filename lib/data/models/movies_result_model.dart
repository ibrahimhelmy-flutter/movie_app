import 'package:movie_app/data/models/movie_mode.dart';

class MoviesResultModel {
  final List<MoveModel> movies;

  MoviesResultModel({required this.movies});

 factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    List<MoveModel> result = [];


    var list = json['results'] as List;

    list.map((value) => result.add(MoveModel.fromJson(value))).toList();
    return MoviesResultModel(movies: result);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

  //  if (this.results != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
  //  }

    return data;
  }
}
