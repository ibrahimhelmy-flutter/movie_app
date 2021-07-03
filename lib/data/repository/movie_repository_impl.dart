import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/domain/entites/error.dart';
import 'package:movie_app/data/domain/entites/movie_entity.dart';
import 'package:movie_app/data/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieEntity>>> getTranding() async {
    try {
      final movies = await remoteDataSource.getTranding();
      return Right(movies);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon()async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow()async {
     try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular()async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }
}
