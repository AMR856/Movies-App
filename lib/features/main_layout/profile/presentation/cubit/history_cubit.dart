import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/history_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/use_cases/get_history_use_case.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUseCase getHistoryUseCase;
  final InsertHistoryUseCase insertHistoryUseCase;
  final DeleteHistoryUseCase deleteHistoryUseCase;

  HistoryCubit({
    required this.getHistoryUseCase,
    required this.insertHistoryUseCase,
    required this.deleteHistoryUseCase,
  }) : super(HistoryInitial());

  void loadHistory() async {
    emit(HistoryLoading());
    final result = await getHistoryUseCase.call();
    result.fold(
          (failure) => emit(HistoryError(failure.message)),
          (history) => emit(HistorySuccess(history)),
    );
  }

  void addHistory(HistoryEntity history) async {
    final result = await insertHistoryUseCase.call(history);
    result.fold(
          (failure) => emit(HistoryError(failure.message)),
          (_) => loadHistory(),
    );
  }

  void removeHistory(int id) async {
    final result = await deleteHistoryUseCase.call(id);
    result.fold(
          (failure) => emit(HistoryError(failure.message)),
          (_) => loadHistory(),
    );
  }
}

abstract class HistoryState {}
class HistoryInitial extends HistoryState {}
class HistoryLoading extends HistoryState {}
class HistorySuccess extends HistoryState {
  final List<HistoryEntity> history;
  HistorySuccess(this.history);
}
class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}
