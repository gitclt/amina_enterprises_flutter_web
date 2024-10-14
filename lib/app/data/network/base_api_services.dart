abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);
  Future<dynamic> loginApi(dynamic data, String url);
}
