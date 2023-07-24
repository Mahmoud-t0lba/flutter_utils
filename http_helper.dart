import 'dart:convert';

import 'package:http/http.dart' as http;

class FxNetwork {
  static Future<NetworkResponse> post(String url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    http.Response response = await http.post(
        NetworkUtil.parseToUri(url, format: true),
        headers: headers,
        body: body,
        encoding: encoding);

    return NetworkResponse(response.body, response.statusCode, response);
  }

  static Future<NetworkResponse> get(String url,
      {Map<String, String>? headers}) async {
    http.Response response = await http.get(
      NetworkUtil.parseToUri(url, format: true),
      headers: headers,
    );

    return NetworkResponse(response.body, response.statusCode, response);
  }

  static Future<NetworkResponse> delete(String url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    http.Response response = await http
        .delete(NetworkUtil.parseToUri(url, format: true), headers: headers);

    return NetworkResponse(response.body, response.statusCode, response);
  }

  static Future<NetworkResponse> put(String url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    http.Response response = await http
        .put(NetworkUtil.parseToUri(url, format: true), headers: headers);

    return NetworkResponse(response.body, response.statusCode, response);
  }

  static Future<NetworkResponse> patch(String url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    http.Response response = await http
        .patch(NetworkUtil.parseToUri(url, format: true), headers: headers);

    return NetworkResponse(response.body, response.statusCode, response);
  }

  static Future<NetworkResponse> head(String url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    http.Response response = await http
        .head(NetworkUtil.parseToUri(url, format: true), headers: headers);

    return NetworkResponse(response.body, response.statusCode, response);
  }
}

class NetworkUtil {
  static String formatUrl(String url) {
    if (url[url.length - 1] == '/') return url.substring(0, url.length - 1);
    return url;
  }

  static Uri parseToUri(String url, {bool format = false}) {
    if (format) {
      return Uri.parse(formatUrl(url));
    }
    return Uri.parse(url);
  }
}

class NetworkResponse {
  late String _body;
  late int _statusCode;
  late http.Response _baseResponse;

  NetworkResponse(String body, int statusCode, http.Response baseResponse) {
    _body = body;
    _statusCode = statusCode;
    _baseResponse = baseResponse;
  }

  int get statusCode => _statusCode;

  String get body => _body;

  http.Response get baseResponse => _baseResponse;
}
