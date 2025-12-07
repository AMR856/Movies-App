
import 'package:injectable/injectable.dart';
import 'package:movies_app/config/db/db_helper.dart';
import 'package:movies_app/features/main_layout/profile/data/local/history_local_data_source.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/history_entity.dart';

@LazySingleton(as: HistoryLocalDataSource)
class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  final DatabaseHelper dbHelper;

  HistoryLocalDataSourceImpl(this.dbHelper);

  @override
  Future<void> insertHistory(HistoryEntity history) async {
    await dbHelper.insertHistory({
      'id': history.id,
      'rating': history.rating,
      'imageUrl': history.imageUrl,
    });
  }

  @override
  Future<List<HistoryEntity>> getHistory() async {
    final list = await dbHelper.getHistory();
    return list
        .map((e) => HistoryEntity(
      id: e['id'] as int?,
      rating: e['rating'] as double,
      imageUrl: e['imageUrl'] as String?,
    ))
        .toList();
  }

  @override
  Future<void> deleteHistory(int id) async {
    await dbHelper.deleteHistory(id);
  }
}
