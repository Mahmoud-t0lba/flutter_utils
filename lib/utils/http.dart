import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xx/model/appmodel.dart';

class HttpService {
  static String get baseUrl => "REPLACE_POST_URL";

  //for post request
  static Future<List<AppModel>> getDataResponse(
      {Map<String, dynamic>? body}) async {
    //you can also pass the headers in post method.
    http.Response res = await http.post(Uri.parse(baseUrl), body: body);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      //replace your own json-model
      List<AppModel> posts = body
          .map(
            (dynamic item) => AppModel.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  //for get request
  static Future<List<AppModel>> getResponse() async {
    http.Response res = await http
        .get(Uri.parse(baseUrl), headers: {"Content-Type": "application/json"});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      //replace your json-model
      List<AppModel> users = body
          .map(
            (dynamic item) => AppModel.fromJson(item),
          )
          .toList();

      return users;
    } else {
      throw "Can't get posts.";
    }
  }
}
