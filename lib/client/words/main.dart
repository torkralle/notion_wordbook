// ð¯ Dart imports:
import 'dart:convert';

// ð Project imports:
import 'package:notion_wordbook/core/http/main.dart';

///  åèªå¸³ã®ãã¼ã¿ãæã£ã¦ãã
/// MapããListã¸ã®å¤æã¯helper/words/new_list.dartã§ãã£ã¦ã
Future<ApiResult> getWordsData(String databaseID, String apiKey) async {
  try {
    final HttpResult response =
        await callPostMethod('$databaseID/query', apiKey);

    // åã£ã¦ãã HttpResult ãã¨ã©ã¼ã®å¯è½æ§ãããã®ã§ããããç®¡çã
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
