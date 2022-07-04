// 📦 Package imports:
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const baseURL = 'https://api.notion.com/v1/databases/';
const pageURL = 'https://api.notion.com/v1/pages/';

var secretKey = dotenv.env['API_KEY'];

Future<HttpResult> callGetMethod(String url) async {
  try {
    return HttpResult.success(await http.get(Uri.parse(url)));
  } catch (e) {
    return HttpResult.failure(e);
  }
}

Future<HttpResult> callPostMethod(String path, String apiKey) async {
  try {
    http.Response response = await http.post(
      Uri.parse(baseURL + path),
      headers: {
        'Authorization': 'Bearer ' + apiKey,
        'Notion-Version': '2021-08-16'
      },
    );
    return HttpResult.success(response);
  } catch (e) {
    return HttpResult.failure(e);
  }
}

Future<HttpResult> callPatchMethod(
  String path,
  String apiKey,
  Map payload,
) async {
  try {
    http.Response response = await http.patch(
      Uri.parse(pageURL + path),
      headers: {
        'Authorization': 'Bearer ' + apiKey,
        'Content-Type': 'application/json',
        'Notion-Version': '2021-08-16'
      },
      body: json.encode(payload),
    );
    return HttpResult.success(response);
  } catch (e) {
    return HttpResult.failure(e);
  }
}

class HttpResult {
  final http.Response? response;
  final Object? error;
  HttpResult.success([this.response, this.error]);
  HttpResult.failure([this.error, this.response]);
}
