part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.flow,
    this.model,
    this.loading,
    this.failure,
    this.lastFailureTime,
    this.page = 1,
  });

  final HomeFlow flow;

  final HomeModel? model;

  final bool? loading;

  /// last error that occured.
  final Failure? failure;

  /// will be used for comparing a new error vs old error.
  final DateTime? lastFailureTime;

  final int page;

  bool get loadMore => model?.books.length == (page * 32);

  @override
  List<Object?> get props => [
        flow,
        model,
        loading,
        failure,
        lastFailureTime,
        page,
      ];

  HomeState copyWith({
    HomeFlow? flow,
    HomeModel? model,
    bool? loading,
    Failure? failure,
    DateTime? lastFailureTime,
    int? page,
  }) {
    return HomeState(
      flow: flow ?? this.flow,
      model: model ?? this.model,
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      lastFailureTime: lastFailureTime ?? this.lastFailureTime,
      page: page ?? this.page,
    );
  }
}
