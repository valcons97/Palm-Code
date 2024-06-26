import 'package:equatable/equatable.dart';

class PersonModel extends Equatable {
  const PersonModel({
    required this.birthYear,
    required this.deathYear,
    required this.name,
  });

  final int birthYear;

  final int deathYear;

  final String name;

  @override
  List<Object?> get props => [
        birthYear,
        deathYear,
        name,
      ];

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
      name: json['name'],
    );
  }

  PersonModel copywith({
    int? birthYear,
    int? deathYear,
    String? name,
  }) =>
      PersonModel(
        birthYear: birthYear ?? this.birthYear,
        deathYear: deathYear ?? this.deathYear,
        name: name ?? this.name,
      );
}
