import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/history_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/repositories/get_history_repository.dart';

@lazySingleton
class GetHistoryUseCase {
  final HistoryRepository repository;

  GetHistoryUseCase(this.repository);

  Future<Either<Failure, List<HistoryEntity>>> call() {
    return repository.getHistory();
  }
}

@lazySingleton
class InsertHistoryUseCase {
  final HistoryRepository repository;

  InsertHistoryUseCase(this.repository);

  Future<Either<Failure, void>> call(HistoryEntity history) {
    return repository.insertHistory(history);
  }
}

@lazySingleton
class DeleteHistoryUseCase {
  final HistoryRepository repository;

  DeleteHistoryUseCase(this.repository);

  Future<Either<Failure, void>> call(int id) {
    return repository.deleteHistory(id);
  }
}
