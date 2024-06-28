part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    this.bookList,
  });

  final List? bookList;

  @override
  List<Object?> get props => [bookList];

  FavoriteState copyWith({
    List? bookList,
  }) {
    return FavoriteState(
      bookList: bookList ?? this.bookList,
    );
  }
}
