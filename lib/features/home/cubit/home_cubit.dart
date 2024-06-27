import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:palm_codes/features/home/model/book_model.dart';
import 'package:palm_codes/features/index.dart';

import '../../../../core/core.dart';

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

  Future<bool> getBooks() async {
    emit(
      state.copyWith(
        loading: true,
        flow: HomeFlow.loaded,
      ),
    );
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
        return true;
      },
    );
  }

  Future<void> addPage() async {
    if (state.loadMore) {
      emit(state.copyWith(page: state.page + 1));

      final result =
          await homeRepository.getBooks(page: state.page, search: state.search);

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
          final List<BookModel> updatedBookList = [];
          updatedBookList.addAll(state.model?.books ?? []);
          final newList = model.books;
          updatedBookList.addAll(newList);

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

  void setSearch(String search) {
    emit(state.copyWith(search: search.replaceAll(' ', '%20'), page: 1));
    getBooks();
  }
}
