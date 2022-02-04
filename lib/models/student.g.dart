// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentsAdapter extends TypeAdapter<Students> {
  @override
  final int typeId = 0;

  @override
  Students read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Students(
      name: fields[0] as String?,
      grade: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Students obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.grade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
