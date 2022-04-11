// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseModelAdapter extends TypeAdapter<DatabaseModel> {
  @override
  final int typeId = 1;

  @override
  DatabaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseModel(
      id: fields[10] as int?,
      title: fields[11] as String?,
      address: fields[12] as String?,
      phoneNumber: fields[13] as int?,
      email: fields[14] as String?,
      discription: fields[15] as String?,
      latitude: fields[16] as double?,
      longitude: fields[19] as double?,
      pic: fields[20] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, DatabaseModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.title)
      ..writeByte(12)
      ..write(obj.address)
      ..writeByte(13)
      ..write(obj.phoneNumber)
      ..writeByte(14)
      ..write(obj.email)
      ..writeByte(15)
      ..write(obj.discription)
      ..writeByte(16)
      ..write(obj.latitude)
      ..writeByte(19)
      ..write(obj.longitude)
      ..writeByte(20)
      ..write(obj.pic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
