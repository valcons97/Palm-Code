import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:palm_codes/features/home/model/book_model.dart';

part 'home_model.g.dart';

/// Model features for example must be modified to use
@HiveType(typeId: 0)
class HomeModel extends Equatable {
  const HomeModel({
    required this.books,
    required this.next,
  });

  @HiveField(0)
  final List<BookModel> books;

  @HiveField(1)
  final String next;

  @override
  List<Object?> get props => [
        books,
        next,
      ];

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final bookList = List<Map<String, dynamic>>.from(json['results'] ?? []);

    return HomeModel(
      books: bookList.map<BookModel>(BookModel.fromJson).toList(),
      next: json['next'] ?? '',
    );
  }

  HomeModel copywith({
    List<BookModel>? books,
    String? next,
  }) =>
      HomeModel(
        books: books ?? this.books,
        next: next ?? this.next,
      );
}
