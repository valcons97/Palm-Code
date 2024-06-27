// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 1;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      id: fields[0] as int,
      title: fields[1] as String,
      subjects: (fields[2] as List).cast<String>(),
      authors: (fields[3] as List).cast<PersonModel>(),
      translators: (fields[4] as List).cast<PersonModel>(),
      booksShelves: (fields[5] as List).cast<String>(),
      languages: (fields[6] as List).cast<String>(),
      copyright: fields[7] as bool,
      mediaType: fields[8] as String,
      downloadCount: fields[9] as int,
      formats: (fields[10] as Map).cast<String, String>(),
      favorite: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subjects)
      ..writeByte(3)
      ..write(obj.authors)
      ..writeByte(4)
      ..write(obj.translators)
      ..writeByte(5)
      ..write(obj.booksShelves)
      ..writeByte(6)
      ..write(obj.languages)
      ..writeByte(7)
      ..write(obj.copyright)
      ..writeByte(8)
      ..write(obj.mediaType)
      ..writeByte(9)
      ..write(obj.downloadCount)
      ..writeByte(10)
      ..write(obj.formats)
      ..writeByte(11)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
