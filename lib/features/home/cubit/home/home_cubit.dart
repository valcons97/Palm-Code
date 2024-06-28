import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:palm_codes/features/index.dart';

import '../../../../../core/core.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.homeRepository,
  ) : super(
          const HomeState(
            flow: HomeFlow.loaded,
          ),
        );

  final IHomeRepository homeRepository;

  final box = Hive.box('books');
  final favoriteBox = Hive.box('favoriteBooks');

  Future<bool> getBooks() async {
    emit(
      state.copyWith(
        loading: true,
        flow: HomeFlow.loaded,
      ),
    );

    if (box.get('${state.page}.${state.search}') != null) {
      final HomeModel model = box.get('${state.page}.${state.search}');
      emit(
        state.copyWith(
          loading: false,
          model: model,
        ),
      );
      return true;
    } else {
      final result =
          await homeRepository.getBooks(page: state.page, search: state.search);

      return result.fold(
        (failure) {
          emit(
            state.copyWith(
              loading: false,
              failure: failure,
              flow: HomeFlow.failure,
              lastFailureTime: DateTime.now(),
            ),
          );
          return false;
        },
        (model) async {
          emit(
            state.copyWith(
              loading: false,
              model: model,
            ),
          );
          box.put('${state.page}.${state.search}', model);
          return true;
        },
      );
    }
  }

  Future<void> addPage() async {
    if (state.loadMore) {
      emit(state.copyWith(page: state.page + 1));

      final List<BookModel> updatedBookList = [];
      updatedBookList.addAll(state.model?.books ?? []);

      if (box.get('${state.page}.${state.search}') != null) {
        final HomeModel model = box.get('${state.page}.${state.search}');

        final newList = model.books;
        updatedBookList.addAll(newList);
        emit(
          state.copyWith(
            loading: false,
            model: HomeModel(books: updatedBookList, next: model.next),
          ),
        );
      } else {
        final result = await homeRepository.getBooks(
            page: state.page, search: state.search);

        result.fold(
          (failure) {
            emit(
              state.copyWith(
                loading: false,
                failure: failure,
                flow: HomeFlow.failure,
                lastFailureTime: DateTime.now(),
              ),
            );
          },
          (model) async {
            final newList = model.books;
            updatedBookList.addAll(newList);

            box.put('${state.page}.${state.search}', model);

            emit(
              state.copyWith(
                loading: false,
                model: HomeModel(books: updatedBookList, next: model.next),
              ),
            );
          },
        );
      }
    }
  }

  Future<void> getFavoriteBooks() async {
    List bookModel = favoriteBox.get('bookList');

    emit(
      state.copyWith(
        bookList: bookModel,
      ),
    );
  }

  void setSearch(String search) {
    emit(state.copyWith(search: search.replaceAll(' ', '%20'), page: 1));
    getBooks();
  }
}
