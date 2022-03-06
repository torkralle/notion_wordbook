import 'dart:convert';
import 'package:notion_wordbook/core/http/main.dart';

Future<ApiResult> getWordsData(String databaseID) async {
  try {
    var response = await postHttp(databaseID + '/query');
    return ApiResult.success(json.decode(response.response!.body)); //json->Map
  } catch (e) {
    return ApiResult.failure(e);
  }
}

class ApiResult {
  final Map? body;
  final Object? error;
  ApiResult.success([this.body, this.error]);
  ApiResult.failure([this.error, this.body]);
}
