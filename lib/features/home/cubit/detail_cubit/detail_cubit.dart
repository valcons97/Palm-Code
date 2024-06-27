import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

part 'detail_state.dart';

@injectable
class DetailCubit extends Cubit<DetailState> {
  DetailCubit()
      : super(
          const DetailState(),
        );

  final box = Hive.box('book');

  void getFavorite(String id) {
    if (box.get(id) == null) {
      emit(state.copyWith(favorite: false));
    } else {
      emit(state.copyWith(favorite: bool.parse(box.get(id))));
    }
  }

  void setFavorite(String id) {
    if (state.favorite!) {
      box.put(id, (false).toString());
    } else {
      box.put(id, (true).toString());
    }

    emit(state.copyWith(favorite: bool.parse(box.get(id))));
  }
}
