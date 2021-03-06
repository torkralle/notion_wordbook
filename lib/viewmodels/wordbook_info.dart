// ๐ฏ Dart imports:
import 'dart:convert';

// ๐ฆ Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ๐ฆ Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/client/words/main.dart';
// ๐ Project imports:
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

  /// ใชในใใใใใผใฟใๅ้คใใใ
  /// ไธๆฆ SharedPreferences ใซไฟๅญใใใฆใใใใผใฟใๅจ้จๅใฃใฆใใฆใใใใใใผในใใฆ List ใซใใฆใใ
  /// ใพใใจใณใณใผใใใฆไฟๅญใ็ดใใ StateNotifier ใฎ state ใซใไฟๅญใใใใจใงใกใใใจๆ็ปใใใใใใซใใใ
  Future<void> removeFromList(String dbName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> storedData =
        json.decode(prefs.getString('wordbooks')!)['wordbooks'];
    storedData.removeWhere((dynamic item) => item['db_name'] == dbName);
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

    // ๅฅๅใใใ DB ๆๅ?ฑใใใๆใใๅคๅฎใใใใใซ็ตๆใไฟๅญใใใใ
    final ApiResult apiResult = await getWordsData(dbId, apiKey);

    // ใจใฉใผใใใฃใใใจใฉใผใ?ใใฃใฆใใ
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

/// ใจใฉใผใฎๆใฏใจใฉใผใฎๅๅฎนใใๆๅใฎๆใฏnullใ่ฟใใ
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
