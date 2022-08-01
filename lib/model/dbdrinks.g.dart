// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dbdrinks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalDrinksAdapter extends TypeAdapter<LocalDrinks> {
  @override
  final int typeId = 0;

  @override
  LocalDrinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalDrinks(
      name: fields[0] as String,
      category: fields[1] as String,
      photo: fields[2] as String,
      oz: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalDrinks obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.oz);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDrinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
