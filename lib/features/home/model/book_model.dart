import 'package:equatable/equatable.dart';

import '_model.dart';

class BookModel extends Equatable {
  const BookModel({
    required this.id,
    required this.title,
    required this.subjects,
    required this.authors,
    required this.translators,
    required this.booksShelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.downloadCount,
  });

  final int id;

  final String title;

  final List<String> subjects;

  final List<PersonModel> authors;

  final List<PersonModel> translators;

  final List<String> booksShelves;

  final List<String> languages;

  final bool copyright;

  final String mediaType;

  final int downloadCount;

  @override
  List<Object?> get props => [
        id,
        title,
        subjects,
        authors,
        translators,
        booksShelves,
        languages,
        copyright,
        mediaType,
        downloadCount,
      ];

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      subjects: json['subjects'],
      authors: json['authors'],
      translators: json['translators'],
      booksShelves: json['bookshelves'],
      languages: json['languages'],
      copyright: json['copyright'],
      mediaType: json['media_type'],
      downloadCount: json['download_count'],
    );
  }

  BookModel copywith({
    int? id,
    String? title,
    List<String>? subjects,
    List<PersonModel>? authors,
    List<PersonModel>? translators,
    List<String>? booksShelves,
    List<String>? languages,
    bool? copyright,
    String? mediaType,
    int? downloadCount,
  }) =>
      BookModel(
        id: id ?? this.id,
        title: title ?? this.title,
        subjects: subjects ?? this.subjects,
        authors: authors ?? this.authors,
        translators: translators ?? this.translators,
        booksShelves: booksShelves ?? this.booksShelves,
        languages: languages ?? this.languages,
        copyright: copyright ?? this.copyright,
        mediaType: mediaType ?? this.mediaType,
        downloadCount: downloadCount ?? this.downloadCount,
      );
}
