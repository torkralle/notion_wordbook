// 📦 Package imports:
import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseURL = 'https://api.notion.com/v1/databases/';
const String pageURL = 'https://api.notion.com/v1/pages/';

Future<HttpResult> callGetMethod(String url) async {
  try {
    return HttpResult.success(await http.get(Uri.parse(url)));
  } catch (e) {
    return HttpResult.failure(e);
  }
}

Future<HttpResult> callPostMethod(String path, String apiKey) async {
  try {
    final response = await http.post(
      Uri.parse(baseURL + path),
      headers: <String, String>{
        'Authorization': 'Bearer $apiKey',
        'Notion-Version': '2021-08-16'
      },
    );
    // statusCode で判定しないとエラーかがわからないので管理。
    if (response.statusCode == 200) {
      return HttpResult.success(response);
    } else {
      return HttpResult.failure(response.statusCode);
    }
  } catch (e) {
    return HttpResult.failure(e);
  }
}

Future<HttpResult> callPatchMethod(
  String path,
  String apiKey,
  Map<dynamic, dynamic> payload,
) async {
  try {
    final response = await http.patch(
      Uri.parse(pageURL + path),
      headers: <String, String>{
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
        'Notion-Version': '2021-08-16'
      },
      body: json.encode(payload),
    );
    if (response.statusCode == 200) {
      return HttpResult.success(response);
    } else {
      return HttpResult.failure(response.statusCode);
    }
  } catch (e) {
    return HttpResult.failure(e);
  }
}

class HttpResult {
  HttpResult.failure(this.error, {this.response});
  HttpResult.success(this.response, {this.error});
  final http.Response? response;
  final Object? error;
}
