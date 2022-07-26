// 🎯 Dart imports:
import 'dart:convert';

// 🌎 Project imports:
import 'package:notion_wordbook/core/http/main.dart';

///  単語帳のデータを持ってくる
/// MapからListへの変換はhelper/words/new_list.dartでやってる
Future<ApiResult> getWordsData(String databaseID, String apiKey) async {
  try {
    final HttpResult response =
        await callPostMethod('$databaseID/query', apiKey);

    // 取ってきた HttpResult がエラーの可能性があるので、それを管理。
    if (response.error != null) {
      return ApiResult.failure(response.error);
    } else {
      return ApiResult.success(
        json.decode(response.response!.body),
      ); //json->Map
    }
  } catch (e) {
    return ApiResult.failure(e);
  }
}

Future<ApiResult> updateWordIsCorrect(
  String apiKey,
  String pageId,
  bool isCorrect,
) async {
  Map<String, dynamic> updatePayload = <String, dynamic>{
    'properties': <String, Map<String, bool>>{
      'Correct': <String, bool>{
        'checkbox': isCorrect,
      }
    }
  };
  try {
    final HttpResult response =
        await callPatchMethod(pageId, apiKey, updatePayload);
    return ApiResult.success(json.decode(response.response!.body)); //json->Map
  } catch (e) {
    return ApiResult.failure(e);
  }
}

class ApiResult {
  final Map<dynamic, dynamic>? body;
  final Object? error;
  ApiResult.success(this.body, {this.error});
  ApiResult.failure(this.error, {this.body});
}
