import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        // headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  static Future<dynamic> getData({
    required String path,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };

    return await dio.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {required String path,
      Map<String, dynamic>? query,
      String lang = 'en',
      String? token,
      required Map<String, dynamic> data}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.post(
      path,
      queryParameters: query,
      data: data,
    );
  }
}
