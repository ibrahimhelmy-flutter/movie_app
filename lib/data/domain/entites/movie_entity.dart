import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  String? posterPath;
  int? id;
  String? backdropPath;
  String? title;
  double? voteAverage;
  String? releaseDate;

  String? overview;

  MovieEntity({
    this.posterPath,
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.title,
    this.id,
    this.backdropPath,
  });

  @override
  List<Object?> get props => [id,title];

  @override
  bool? get stringify => true;
}
