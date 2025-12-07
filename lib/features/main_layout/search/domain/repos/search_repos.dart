import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';

abstract class SearchRepos {
  Future<Either<Failure, List<MoviesEntity>>> getSearchMovie(String? keySearch);
}
