import 'package:dio/dio.dart';
import 'package:futara/controller/constants/strings.dart';

class DioHelper {
  static late Dio dio;
  static String url = '${AppStrings.baseUrl}/api/';
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      AppStrings.accept: AppStrings.applicationJson,
      AppStrings.authorization: 'Bearer ${AppStrings.loginToken}',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

// ====================================================

  static Future<Response> postData({
    required String url,
    required FormData data,
  }) async {
    dio.options.headers = {
      AppStrings.accept: AppStrings.applicationJson,
      AppStrings.authorization: 'Bearer ${AppStrings.loginToken}',
    };
    return dio.post(url, data: data);
  }

// ====================================================

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required FormData data,
  }) async {
    dio.options.headers = {
      AppStrings.accept: AppStrings.applicationJson,
      AppStrings.authorization: 'Bearer ${AppStrings.loginToken}',
    };
    return dio.put(url, queryParameters: query, data: data);
  }

// ====================================================
  static Future<Response> deleteData({required String url}) {
    return dio.delete(url);
  }
}
