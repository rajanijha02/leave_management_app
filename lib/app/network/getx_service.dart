import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PostsProvider extends GetConnect {
  final String _baseUrl = "https://api.lms.booringcodes.in/api/";
  // final String _baseUrl = 'http://172.30.1.86:3002/api/';
  final local = GetStorage();

  Future<Response> getCall(
    String url,
  ) async =>
      await get(_baseUrl + url,
          headers: {"authorization": "${local.read("token")}"});

  Future<Response> postCall(
    String url,
    Map<String, dynamic> data,
  ) async =>
      await post(_baseUrl + url, data,
          headers: {"authorization": "${local.read("token")}"});

  Future<Response> patchCall(
    String url,
    Map<String, dynamic> data,
  ) async =>
      await patch(_baseUrl + url, data,
          headers: {"authorization": "${local.read("token")}"});
  Future<Response> delCall(
    String url,
  ) async =>
      await delete(_baseUrl + url,
          headers: {"authorization": "Bearer ${local.read("token")}"});
}
