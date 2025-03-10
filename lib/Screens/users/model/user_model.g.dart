// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class userModelAdapter extends TypeAdapter<userModel> {
  @override
  final int typeId = 10;

  @override
  userModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return userModel(
      id: fields[0] as int?,
      userName: fields[1] as String?,
      fullName: fields[3] as String?,
      userMail: fields[4] as String?,
      emailVerifiedAt: fields[5] as String?,
      userPhone: fields[6] as String?,
      userPassword: fields[7] as String?,
      userType: fields[8] as String?,
      status: fields[9] as String?,
      permissions: fields[10] as int?,
      note: fields[11] as String?,
      avatar: fields[12] as String?,
      rememberToken: fields[13] as String?,
      createdAt: fields[14] as String?,
      updatedAt: fields[15] as String?,
      roleTitle: fields[16] as String?,
      roleDescription: fields[17] as String?,
      rolePermissions: fields[18] as String?,
      enterpriseId: fields[19] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, userModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.userMail)
      ..writeByte(5)
      ..write(obj.emailVerifiedAt)
      ..writeByte(6)
      ..write(obj.userPhone)
      ..writeByte(7)
      ..write(obj.userPassword)
      ..writeByte(8)
      ..write(obj.userType)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.permissions)
      ..writeByte(11)
      ..write(obj.note)
      ..writeByte(12)
      ..write(obj.avatar)
      ..writeByte(13)
      ..write(obj.rememberToken)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt)
      ..writeByte(16)
      ..write(obj.roleTitle)
      ..writeByte(17)
      ..write(obj.roleDescription)
      ..writeByte(18)
      ..write(obj.rolePermissions)
      ..writeByte(19)
      ..write(obj.enterpriseId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is userModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
