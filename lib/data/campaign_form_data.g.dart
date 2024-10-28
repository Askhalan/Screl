// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_form_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CampaignFormDataAdapter extends TypeAdapter<CampaignFormData> {
  @override
  final int typeId = 1;

  @override
  CampaignFormData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignFormData(
      subject: fields[0] as String?,
      previewText: fields[1] as String?,
      name: fields[2] as String?,
      email: fields[3] as String?,
      runOnce: fields[4] as bool,
      customAudience: fields[5] as bool,
      currentStep: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CampaignFormData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.previewText)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.runOnce)
      ..writeByte(5)
      ..write(obj.customAudience)
      ..writeByte(6)
      ..write(obj.currentStep);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignFormDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
