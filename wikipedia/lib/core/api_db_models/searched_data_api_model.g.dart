// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_data_api_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

// class SearchedDataApiModelAdapter extends TypeAdapter<SearchedDataApiModel> {
//   @override
//   final int typeId = 0;
//
//   @override
//   SearchedDataApiModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return SearchedDataApiModel(
//       query: fields[0] as Query,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, SearchedDataApiModel obj) {
//     writer
//       ..writeByte(1)
//       ..writeByte(0)
//       ..write(obj.query);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is SearchedDataApiModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class QueryAdapter extends TypeAdapter<Query> {
//   @override
//   final int typeId = 0;
//
//   @override
//   Query read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Query(
//       pages: (fields[0] as List)?.cast<Pages>(),
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, Query obj) {
//     writer
//       ..writeByte(1)
//       ..writeByte(0)
//       ..write(obj.pages);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is QueryAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

class PagesAdapter extends TypeAdapter<Pages> {
  @override
  final int typeId = 0;

  @override
  Pages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pages(
      pageid: fields[0] as int,
      ns: fields[1] as int,
      title: fields[2] as String,
      index: fields[3] as int,
      thumbnail: fields[4] as Thumbnail,
      terms: fields[5] as Terms,
    );
  }

  @override
  void write(BinaryWriter writer, Pages obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.pageid)
      ..writeByte(1)
      ..write(obj.ns)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.index)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.terms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThumbnailAdapter extends TypeAdapter<Thumbnail> {
  @override
  final int typeId = 1;

  @override
  Thumbnail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Thumbnail(
      source: fields[0] as String,
      width: fields[1] as int,
      height: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Thumbnail obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThumbnailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TermsAdapter extends TypeAdapter<Terms> {
  @override
  final int typeId = 2;

  @override
  Terms read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Terms(
      description: (fields[0] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Terms obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TermsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
