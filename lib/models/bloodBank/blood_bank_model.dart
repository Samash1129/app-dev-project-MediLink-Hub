import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_bank_model.freezed.dart';
part 'blood_bank_model.g.dart';

@freezed
abstract class BloodBankModel with _$BloodBankModel {
  factory BloodBankModel({
    required String name,
    required String contactNumber,
    required String address,
    required List<String> bloodTypes,
  }) = _BloodBankModel;

  factory BloodBankModel.fromJson(Map<String, dynamic> json) =>
      _$BloodBankModelFromJson(json);
}
