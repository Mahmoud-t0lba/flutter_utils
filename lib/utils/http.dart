import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  static String get baseUrl => "REPLACE_POST_URL";

  /// for post request
  static Future<List<ExampleModel>> getDataResponse(
      {Map<String, dynamic>? body}) async {
    /// you can also pass the headers in post method.
    http.Response res = await http.post(Uri.parse(baseUrl), body: body);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      /// replace your own json-model
      List<ExampleModel> posts = body
          .map(
            (dynamic item) => ExampleModel.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  /// for get request
  static Future<List<ExampleModel>> getResponse() async {
    http.Response res = await http
        .get(Uri.parse(baseUrl), headers: {"Content-Type": "application/json"});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      /// replace your json-model
      List<ExampleModel> users =
          body.map((dynamic item) => ExampleModel.fromJson(item)).toList();

      return users;
    } else {
      throw "Can't get posts.";
    }
  }
}

class ExampleModel {
  String? message;
  int? status;

  ExampleModel({
    this.message = "",
    this.status,
  });

  ExampleModel.fromJson(Map<String, dynamic> map) {
    message = map['message'] ?? "";
    status = map['status'] ?? 0;
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
      };
}
