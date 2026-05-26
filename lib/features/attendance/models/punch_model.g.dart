// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'punch_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PunchModelAdapter extends TypeAdapter<PunchModel> {
  @override
  final int typeId = 0;

  @override
  PunchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PunchModel(
      title: fields[0] as String,
      time: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PunchModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PunchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
