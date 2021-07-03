import 'package:movie_app/data/domain/entites/movie_entity.dart';

class MoveModel extends MovieEntity {
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? overview;
  String? releaseDate;
  String? title;
  int? id;
  bool? adult;
  String? backdropPath;
  double? popularity;
  String? mediaType;

  MoveModel(
      {this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.overview,
      this.releaseDate,
      this.title,
      this.id,
      this.adult,
      this.backdropPath,
      this.popularity,
      this.mediaType});

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(
    genreIds : json['genre_ids'].cast<int>(),
    originalLanguage : json['original_language'],
    originalTitle : json['original_title'],
    posterPath : json['poster_path'],
    video : json['video'],
    voteAverage : json['vote_average']?.toDouble()??0.0,
    voteCount : json['vote_count'],
    overview : json['overview'],
    releaseDate : json['release_date'],
    title : json['title'],
    id : json['id'],
    adult : json['adult'],
    backdropPath : json['backdrop_path'],
    popularity : json['popularity']?.toDouble()??0.0,
    mediaType : json['media_type'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
