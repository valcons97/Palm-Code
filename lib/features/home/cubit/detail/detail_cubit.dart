import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:palm_codes/features/index.dart';

part 'detail_state.dart';

@injectable
class DetailCubit extends Cubit<DetailState> {
  DetailCubit()
      : super(
          const DetailState(),
        );

  final isFavoriteBox = Hive.box('book');
  final favoriteBox = Hive.box('favoriteBooks');

  void getFavorite(String id) {
    if (isFavoriteBox.get(id) == null) {
      emit(state.copyWith(favorite: false));
    } else {
      emit(state.copyWith(favorite: bool.parse(isFavoriteBox.get(id))));
    }
  }

  void setFavorite(String id, BookModel book) {
    List bookModel = [];
    if (favoriteBox.get('bookList') == null) {
      favoriteBox.put('bookList', bookModel);
    }
    if (state.favorite!) {
      isFavoriteBox.put(id, (false).toString());
      bookModel.addAll(favoriteBox.get('bookList'));
      bookModel.remove(book);
      favoriteBox.put('bookList', bookModel);
    } else {
      isFavoriteBox.put(id, (true).toString());
      bookModel.addAll(favoriteBox.get('bookList'));
      bookModel.add(book);
      favoriteBox.put('bookList', bookModel);
    }

    emit(state.copyWith(favorite: bool.parse(isFavoriteBox.get(id))));
  }
}
