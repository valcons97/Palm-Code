// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonModelAdapter extends TypeAdapter<PersonModel> {
  @override
  final int typeId = 2;

  @override
  PersonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonModel(
      birthYear: fields[0] as int?,
      deathYear: fields[1] as int?,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.birthYear)
      ..writeByte(1)
      ..write(obj.deathYear)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
