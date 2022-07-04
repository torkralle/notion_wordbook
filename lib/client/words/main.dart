// 🎯 Dart imports:
import 'dart:convert';

// 🌎 Project imports:
import 'package:notion_wordbook/core/http/main.dart';

///  単語帳のデータを持ってくる
/// MapからListへの変換はhelper/words/new_list.dartでやってる
Future<ApiResult> getWordsData(String databaseID, apiKey) async {
  try {
    var response = await callPostMethod(databaseID + '/query', apiKey);
    return ApiResult.success(json.decode(response.response!.body)); //json->Map
  } catch (e) {
    return ApiResult.failure(e);
  }
}

Future<ApiResult> updateIsCorrect(
  String apiKey,
  pageId,
  bool isCorrect,
) async {
  var updatePayload = {
    'properties': {
      'Correct': {
        'checkbox': isCorrect,
      }
    }
  };
  try {
    var response = await callPatchMethod(pageId, apiKey, updatePayload);
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
