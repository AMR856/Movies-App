import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/history_entity.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<HistoryEntity>>> getHistory();
  Future<Either<Failure, void>> insertHistory(HistoryEntity history);
  Future<Either<Failure, void>> deleteHistory(int id);
}