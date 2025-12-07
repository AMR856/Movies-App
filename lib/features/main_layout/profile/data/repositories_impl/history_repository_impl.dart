import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/profile/data/local/history_local_data_source.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/history_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/repositories/get_history_repository.dart';

@LazySingleton(as: HistoryRepository)
class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryLocalDataSource localDataSource;

  HistoryRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<HistoryEntity>>> getHistory() async {
    try {
      final history = await localDataSource.getHistory();
      return Right(history);
    } catch (e) {
      print(e.toString());
      return Left(Failure(message: 'Failed to fetch history'));
    }
  }

  @override
  Future<Either<Failure, void>> insertHistory(HistoryEntity history) async {
    try {
      await localDataSource.insertHistory(history);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to insert history'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHistory(int id) async {
    try {
      await localDataSource.deleteHistory(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to delete history'));
    }
  }
}
