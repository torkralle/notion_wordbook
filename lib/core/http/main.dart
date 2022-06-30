// 📦 Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const baseURL = 'https://api.notion.com/v1/databases/';
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

class HttpResult {
  final http.Response? response;
  final Object? error;
  HttpResult.success(this.response, {this.error});
  HttpResult.failure(this.error, {this.response});
}
