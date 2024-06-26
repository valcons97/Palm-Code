part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.flow,
    this.books,
    this.loading,
    this.failure,
    this.lastFailureTime,
  });

  final HomeFlow flow;

  final HomeModel? books;

  final bool? loading;

  /// last error that occured.
  final Failure? failure;

  /// will be used for comparing a new error vs old error.
  final DateTime? lastFailureTime;

  @override
  List<Object?> get props => [
        flow,
        books,
        loading,
        failure,
        lastFailureTime,
      ];

  HomeState copyWith({
    HomeFlow? flow,
    HomeModel? books,
    bool? loading,
    Failure? failure,
    DateTime? lastFailureTime,
  }) {
    return HomeState(
      flow: flow ?? this.flow,
      books: books ?? this.books,
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      lastFailureTime: lastFailureTime ?? this.lastFailureTime,
    );
  }
}
