import 'package:json_annotation/json_annotation.dart';
import 'package:toonflix/network/enum_type_data.dart';
import 'package:toonflix/network/response/base_response.dart';

part 'version_response.g.dart';

/// 쉽배송 version Api response
@JsonSerializable()
class VersionResponse extends BaseResponse {
  final List<Version> response;

  VersionResponse(
    super.code,
    super.message,
    super.error,
    this.response,
  );

  factory VersionResponse.fromJson(Map<String, dynamic> json) =>
      _$VersionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VersionResponseToJson(this);
}

@JsonSerializable()
class Version {
  final EnumTypeData osCode;
  final int lastVer;
  final String lastVerNm;
  final int minVer;
  final String minVerNm;
  final String forceUpdate;

  Version(
    this.osCode,
    this.lastVer,
    this.lastVerNm,
    this.minVer,
    this.minVerNm,
    this.forceUpdate,
  );

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);

  @override
  String toString() {
    return 'lastVer: $lastVer lastVerNm: $lastVerNm minVer: $minVer minVerNm: $minVerNm forceUpdate: $forceUpdate ${osCode.toString()}';
  }
}

enum AppVersionOsCode {
  AOS,
  IOS,
}
