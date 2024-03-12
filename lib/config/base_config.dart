// 앱 구성 정보 추상객체
abstract class BaseConfig {
  /// API 서비스 호스트 url
  String getHostUrl();

  /// API 서비스용 기본 토큰
  String getToken();
}
