import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '_model.dart';

part 'book_model.g.dart';

@HiveType(typeId: 1)
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
    required this.formats,
    this.favorite = false,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<String> subjects;

  @HiveField(3)
  final List<PersonModel> authors;

  @HiveField(4)
  final List<PersonModel> translators;

  @HiveField(5)
  final List<String> booksShelves;

  @HiveField(6)
  final List<String> languages;

  @HiveField(7)
  final bool copyright;

  @HiveField(8)
  final String mediaType;

  @HiveField(9)
  final int downloadCount;

  @HiveField(10)
  final Map<String, String> formats;

  @HiveField(11)
  final bool favorite;

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
        formats,
        favorite,
      ];

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final subjectList = List<String>.from(json['subjects'] ?? []);
    final authorsList = List<Map<String, dynamic>>.from(json['authors'] ?? []);
    final translatorList =
        List<Map<String, dynamic>>.from(json['translators'] ?? []);
    final shelvesList = List<String>.from(json['bookshelves'] ?? []);
    final languagesList = List<String>.from(json['languages'] ?? []);
    final formatMap = Map<String, String>.from(json['formats'] ?? emptyMap());

    return BookModel(
      id: json['id'],
      title: json['title'],
      subjects: subjectList,
      authors: authorsList.map<PersonModel>(PersonModel.fromJson).toList(),
      translators:
          translatorList.map<PersonModel>(PersonModel.fromJson).toList(),
      booksShelves: shelvesList,
      languages: languagesList,
      copyright: json['copyright'],
      mediaType: json['media_type'],
      downloadCount: json['download_count'],
      formats: formatMap,
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
    Map<String, String>? formats,
    bool? favorite,
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
          formats: formats ?? this.formats,
          favorite: favorite ?? this.favorite);
}
