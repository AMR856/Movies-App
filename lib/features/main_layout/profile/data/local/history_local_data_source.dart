import 'package:movies_app/features/main_layout/profile/domain/entites/history_entity.dart';

abstract class HistoryLocalDataSource {
  Future<List<HistoryEntity>> getHistory();
  Future<void> insertHistory(HistoryEntity history);
  Future<void> deleteHistory(int id);
}
