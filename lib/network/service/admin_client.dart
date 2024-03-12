import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:toonflix/network/api_path.dart';
import 'package:toonflix/network/response/version_response.dart';
import 'package:retrofit/http.dart';

part 'admin_client.g.dart';

@RestApi()
abstract class AdminClient {
  factory AdminClient(Dio dio) = _AdminClient;

  @GET(APIPath.getAppVersionPath)
  Future<VersionResponse> getAppVersion(
      @Header('Authorization') String authorization);
}
