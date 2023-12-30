// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodBankModelImpl _$$BloodBankModelImplFromJson(Map<String, dynamic> json) =>
    _$BloodBankModelImpl(
      name: json['name'] as String,
      contactNumber: json['contactNumber'] as String,
      address: json['address'] as String,
      bloodTypes: (json['bloodTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BloodBankModelImplToJson(
        _$BloodBankModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contactNumber': instance.contactNumber,
      'address': instance.address,
      'bloodTypes': instance.bloodTypes,
    };
