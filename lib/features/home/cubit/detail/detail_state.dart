part of 'detail_cubit.dart';

class DetailState extends Equatable {
  const DetailState({this.favorite});

  final bool? favorite;

  @override
  List<Object?> get props => [favorite];

  DetailState copyWith({
    bool? favorite,
  }) {
    return DetailState(
      favorite: favorite ?? this.favorite,
    );
  }
}
