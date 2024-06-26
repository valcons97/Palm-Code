import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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
    final result = await homeRepository.getBooks();

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
      (books) async {
        emit(
          state.copyWith(
            loading: false,
            books: books,
          ),
        );
        return true;
      },
    );
  }
}
