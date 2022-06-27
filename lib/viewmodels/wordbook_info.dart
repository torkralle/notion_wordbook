// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/objects/models/notion_key.dart';

class WordbookInfoListViewModel extends StateNotifier<List<dynamic>> {
  WordbookInfoListViewModel() : super([]);

  Future<void> initState() async {
    await getWordbookList();
  }

  Future<void> getWordbookList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('wordbooks')) {
      return;
    }
    List storedData =
        json.decode(prefs.getString('wordbooks') ?? '')['wordbooks'];
    state = storedData;
  }
}

final wordbookInfoListProvider =
    StateNotifierProvider<WordbookInfoListViewModel, List<dynamic>>((ref) {
  return WordbookInfoListViewModel();
});

class WordbookInfoViewModel extends StateNotifier<WordbookInfo> {
  WordbookInfoViewModel() : super(const WordbookInfo('', '', ''));

  void setDBName(dbName) {
    state = WordbookInfo(dbName, '', '');
  }

  void updateDBId(dbId) {
    state = WordbookInfo(state.dbName, state.apiKey, dbId);
  }

  void updateAPIKey(apiKey) {
    state = WordbookInfo(state.dbName, apiKey, state.dbName);
  }

  void updateDBInfo(dbName, apiKey, dbId) {
    state = WordbookInfo(dbName, apiKey, dbId);
  }

  Future<void> setDBInfo(apiKey, dbId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final dbName = state.dbName;
    state = const WordbookInfo('', '', '');

    Map<String, String> dbInfo = {
      'db_name': dbName,
      'api_key': apiKey,
      'db_id': dbId,
    };

    if (!prefs.containsKey('wordbooks')) {
      debugPrint('no wordbooks');
      String data = json.encode({
        'wordbooks': [dbInfo]
      });
      prefs.setString('wordbooks', data);
      return;
    }

    List storedData =
        json.decode(prefs.getString('wordbooks') ?? '')['wordbooks'];
    if (storedData
        .where((element) => element['db_name'] == dbName)
        .isNotEmpty) {
      return;
    }
    storedData.add(dbInfo);
    prefs.setString('wordbooks', json.encode({'wordbooks': storedData}));
  }
}

final wordbookInfoProvider =
    StateNotifierProvider<WordbookInfoViewModel, WordbookInfo>((ref) {
  return WordbookInfoViewModel();
});
