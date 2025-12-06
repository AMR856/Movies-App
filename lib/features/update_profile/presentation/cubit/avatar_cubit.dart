import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/assets_manager.dart';

class AvatarCubit extends Cubit<int> {

  static final List<String> imagesPathAvatar = [
    ImageAssets.character1,
    ImageAssets.character2,
    ImageAssets.character3,
    ImageAssets.character4,
    ImageAssets.character5,
    ImageAssets.character6,
    ImageAssets.character7,
    ImageAssets.character8,
    ImageAssets.character9,
  ];

  AvatarCubit() : super(1);

  void selectAvatar(int index) => emit(index);
}