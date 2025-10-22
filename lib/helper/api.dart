import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();
  Future<Response> getRequest(String url) async {
    try {
      var response = await dio.get(url);
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  Future<Response> postRequest(String url, Map<String, dynamic> data) async {
    try {
      var response = await dio.post(
        url,
        data: data,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {'Accept': 'application/json'},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to post data: ${e.message}');
    }
  }

  Future<Response> putRequest(String url, Map<String, dynamic> data ) async {
    try {
      var response = await dio.put(
        url,
        data: data,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {'Accept': 'application/json'},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to put data: ${e.message}');
    }
  }
}
