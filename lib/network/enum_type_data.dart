import 'package:json_annotation/json_annotation.dart';

part 'enum_type_data.g.dart';

/// Enum형태 Json object
@JsonSerializable()
class EnumTypeData {
  final String name;
  final String code;
  final String desc;

  EnumTypeData(
    this.name,
    this.code,
    this.desc,
  );

  factory EnumTypeData.fromJson(Map<String, dynamic> json) =>
      _$EnumTypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$EnumTypeDataToJson(this);

  @override
  String toString() {
    return 'code: $code';
  }
}
