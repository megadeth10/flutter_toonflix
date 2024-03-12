/// 쉽배송 API 최상위 응답 구조
abstract class BaseResponse {
  final int code;
  final String? message;
  final String? error;

  BaseResponse(
    this.code,
    this.message,
    this.error,
  );
}

enum BaseResponseKeyName {
  code,
  message,
  error,
  response,
}
