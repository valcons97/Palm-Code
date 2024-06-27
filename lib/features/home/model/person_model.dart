import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'person_model.g.dart';

@HiveType(typeId: 2)
class PersonModel extends Equatable {
  const PersonModel({
    this.birthYear,
    this.deathYear,
    required this.name,
  });

  @HiveField(0)
  final int? birthYear;

  @HiveField(1)
  final int? deathYear;

  @HiveField(2)
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
