import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

part 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  final favoriteBox = Hive.box('favoriteBooks');

  Future<void> getFavoriteBooks() async {
    List bookModel = favoriteBox.get('bookList');

    emit(
      state.copyWith(
        bookList: bookModel,
      ),
    );
  }
}
