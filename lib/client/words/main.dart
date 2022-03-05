import 'dart:convert';
import 'package:notion_wordbook/core/http/main.dart';

Future getWordsData(String databaseID) async {
  try {
    var response = await postHttp(databaseID + '/query');
    return json.decode(response.body); //json->Map
  } catch (e) {
    print(e);
  }
}
