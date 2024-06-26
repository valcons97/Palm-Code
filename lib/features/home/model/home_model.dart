import 'package:equatable/equatable.dart';
import 'package:palm_codes/features/home/model/book_model.dart';

/// Model features for example must be modified to use
class HomeModel extends Equatable {
  const HomeModel({
    required this.books,
  });

  final List<BookModel> books;

  @override
  List<Object?> get props => [
        books,
      ];

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      books: json['results'],
    );
  }

  HomeModel copywith({
    List<BookModel>? books,
  }) =>
      HomeModel(
        books: books ?? this.books,
      );
}
