import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

const baseURL = 'https://api.notion.com/v1/databases/';
var secretKey = dotenv.env['API_KEY'];

Future<HttpResult> callGetMethod(String url) async {
  try {
    return HttpResult.success(await http.get(Uri.parse(url)));
  } catch (e) {
    return HttpResult.failure(e);
  }
}

Future<HttpResult> callPostMethod(String path) async {
  try {
    http.Response response = await http.post(Uri.parse(baseURL + path),
        headers: {
          'Authorization': 'Bearer ' + secretKey!,
          'Notion-Version': '2021-08-16'
        });
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
