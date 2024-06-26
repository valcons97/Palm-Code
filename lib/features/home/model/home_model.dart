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
    final bookList = List<Map<String, dynamic>>.from(json['results'] ?? []);

    return HomeModel(
      books: bookList.map<BookModel>(BookModel.fromJson).toList(),
    );
  }

  HomeModel copywith({
    List<BookModel>? books,
  }) =>
      HomeModel(
        books: books ?? this.books,
      );
}
