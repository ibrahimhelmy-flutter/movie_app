import 'package:dartz/dartz.dart';
import 'package:movie_app/data/domain/entites/error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError,Type>> call(Params parms);
}
