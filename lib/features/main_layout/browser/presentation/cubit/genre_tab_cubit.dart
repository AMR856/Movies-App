
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreTabCubit extends Cubit<int> {
  GenreTabCubit() : super(0);

  void selectTab(int index) => emit(index);
}