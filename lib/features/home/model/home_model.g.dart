// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeModelAdapter extends TypeAdapter<HomeModel> {
  @override
  final int typeId = 0;

  @override
  HomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeModel(
      books: (fields[0] as List).cast<BookModel>(),
      next: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.books)
      ..writeByte(1)
      ..write(obj.next);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
