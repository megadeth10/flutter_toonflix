import 'dart:io';

/*
 * http image file load 시에 403 오류
 * ref: https://gist.github.com/preinpost/941efd33dff90d9f8c7a208da40c18a9
 */
class HttpUserAgentOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}
