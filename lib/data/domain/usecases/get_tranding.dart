import 'package:dartz/dartz.dart';
import 'package:movie_app/data/domain/entites/error.dart';
import 'package:movie_app/data/domain/entites/movie_entity.dart';
import 'package:movie_app/data/domain/entites/no_params.dart';
import 'package:movie_app/data/domain/repository/movie_repository.dart';
import 'package:movie_app/data/domain/usecases/usecase.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;
  GetTrending(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getTranding();
  }
}
