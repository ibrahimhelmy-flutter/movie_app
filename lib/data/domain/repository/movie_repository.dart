import 'package:dartz/dartz.dart';
import 'package:movie_app/data/domain/entites/error.dart';
import 'package:movie_app/data/domain/entites/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTranding();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
}
