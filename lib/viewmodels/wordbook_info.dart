// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/client/words/main.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/objects/models/notion_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordbookInfoListViewModel
    extends StateNotifier<AsyncValue<List<dynamic>>> {
  WordbookInfoListViewModel()
      : super(const AsyncValue<List<dynamic>>.data(<dynamic>[]));

  void getWordbookList(SharedPreferences prefs) {
    if (!prefs.containsKey('wordbooks')) {
      return;
    }
    List<dynamic> storedData =
        json.decode(prefs.getString('wordbooks') ?? '')['wordbooks'];
    state = AsyncValue<List<dynamic>>.data(storedData);
  }

  /// リストからデータを削除する。
  /// 一旦 SharedPreferences に保存されているデータを全部取ってきて、それをパースして List にしてから
  /// またエンコードして保存し直す。 StateNotifier の state にも保存することでちゃんと描画されるようにする。
  Future<void> removeFromList(String apiKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> storedData =
        json.decode(prefs.getString('wordbooks')!)['wordbooks'];
    storedData.removeWhere((dynamic item) => item['api_key'] == apiKey);
    state = AsyncValue<List<dynamic>>.data(storedData);
    prefs.setString(
      'wordbooks',
      json.encode(<String, dynamic>{'wordbooks': storedData}),
    );
  }
}

final StateNotifierProvider<WordbookInfoListViewModel,
        AsyncValue<List<dynamic>>>
    wordbookInfoListProvider =
    StateNotifierProvider<WordbookInfoListViewModel, AsyncValue<List<dynamic>>>(
        (
  StateNotifierProviderRef<WordbookInfoListViewModel, AsyncValue<List<dynamic>>>
      ref,
) {
  return WordbookInfoListViewModel();
});

class WordbookInfoViewModel extends StateNotifier<WordbookInfo> {
  WordbookInfoViewModel() : super(const WordbookInfo('', '', ''));

  void setDBName(String dbName) {
    state = WordbookInfo(dbName, '', '');
  }

  void updateDBId(String dbId) {
    state = WordbookInfo(state.dbName, state.apiKey, dbId);
  }

  void updateAPIKey(String apiKey) {
    state = WordbookInfo(state.dbName, apiKey, state.dbName);
  }

  void updateDBInfo(String dbName, String apiKey, String dbId) {
    state = WordbookInfo(dbName, apiKey, dbId);
  }

  Future<DBStatus> setDBInfo(String apiKey, String dbId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String dbName = state.dbName;

    // 入力された DB 情報がいい感じか判定するために結果を保存したい。
    final ApiResult apiResult = await getWordsData(dbId, apiKey);

    // エラーがあったらエラーだよってする
    if (apiResult.error != null) {
      return const DBStatus(
        Status.error,
        description: ErrorDescription.dbNotFoundOrConnectionError,
      );
    } else {
      Map<String, String> dbInfo = <String, String>{
        'db_name': dbName,
        'api_key': apiKey,
        'db_id': dbId,
      };

      if (!prefs.containsKey('wordbooks')) {
        debugPrint('no wordbooks');
        String data = json.encode(<String, List<Map<String, String>>>{
          'wordbooks': <Map<String, String>>[dbInfo]
        });
        prefs.setString('wordbooks', data);
      }

      List<dynamic> storedData =
          json.decode(prefs.getString('wordbooks') ?? '')['wordbooks'];
      if (storedData
          .where((dynamic element) => element['db_name'] == dbName)
          .isNotEmpty) {
        return const DBStatus(Status.success);
      }
      storedData.add(dbInfo);
      prefs.setString(
        'wordbooks',
        json.encode(<String, dynamic>{'wordbooks': storedData}),
      );
      return const DBStatus(Status.success);
    }
  }
}

final StateNotifierProvider<WordbookInfoViewModel, WordbookInfo>
    wordbookInfoProvider =
    StateNotifierProvider<WordbookInfoViewModel, WordbookInfo>(
        (StateNotifierProviderRef<WordbookInfoViewModel, WordbookInfo> ref) {
  return WordbookInfoViewModel();
});

/// エラーの時はエラーの内容を、成功の時はnullを返す。
@immutable
class DBStatus {
  final Status status;
  final ErrorDescription? description;
  const DBStatus(this.status, {this.description});
}

enum Status {
  success,
  error,
}

enum ErrorDescription {
  dbNotFoundOrConnectionError,
  wordbookKeyNotFound,
}
