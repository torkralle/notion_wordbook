// 📦 Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/objects/models/notion_key.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class WordbookInfoViewModel extends StateNotifier<WordbookInfo> {
  WordbookInfoViewModel() : super(const WordbookInfo('', '', ''));

  Future<void> initState() async {
    await getAPIKey();
    await getDBID();
    await getDBName();
  }

  Future<void> getDBNameKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final apiKey = prefs.getString('api_key') ?? '';
    state = WordbookInfo(state.dbName, apiKey, state.dbID);
  }

  Future<void> getAPIKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final apiKey = prefs.getString('api_key') ?? '';
    state = WordbookInfo(state.dbName, apiKey, state.dbID);
  }

  Future<void> getDBID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final dbID = prefs.getString('db_id') ?? '';
    state = WordbookInfo(state.dbName, state.apiKey, dbID);
  }

  Future<void> setDBName(dbName) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (!prefs.containsKey('wordbooks')) {
    //   return;
    // }
    // final data = json.encode({
    //   'dbName': dbName,
    // });
    // prefs.setString(dbName, data);
    state = WordbookInfo(dbName, '', '');
  }

  Future<void> getDBName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('星子')) {
      debugPrint('no 星子');
      return;
    }
    debugPrint(prefs.getString('星子'));
  }

  void updateDBId(dbId) async {
    state = WordbookInfo(state.dbName, state.apiKey, dbId);
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (!prefs.containsKey(state.dbName)) {
    //   debugPrint('no' + state.dbName);
    //   return;
    // }
    // final jsonData = json.decode(prefs.getString(state.dbName) ?? '');
    // jsonData['db_id'] = dbID ?? '';
    // final data = json.encode(jsonData);
    //
    // prefs.setString(state.dbName, data);
    // prefs.setString('db_id', dbID);
  }

  Future<void> updateAPIKey(apiKey) async {
    state = WordbookInfo(state.dbName, apiKey, state.dbName);
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (!prefs.containsKey(state.dbName)) {
    //   debugPrint('no' + state.dbName);
    //   return;
    // }
    // final jsonData = json.decode(prefs.getString(state.dbName) ?? '');
    // jsonData['api_key'] = apiKey ?? '';
    // final data = json.encode(jsonData);
    // prefs.setString(state.dbName, data);
    //
    // print(prefs.getString(state.dbName));
    // print(data);
  }

  Future<void> setDBInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> dbInfo = {
      'db_name': state.dbName,
      'api_key': state.apiKey,
      'db_id': state.dbID
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
        .where((element) => element['db_name'] == state.dbName)
        .isNotEmpty) {
      return;
    }
    storedData.add(dbInfo);
    prefs.setString('wordbooks', json.encode({'wordbooks': storedData}));
    // prefs.setString(state.dbName, d);
    print('私だ');
    print(json.encode({'wordbooks': storedData}));
    // print(data);
  }
}

final WordbookInfoProvider =
    StateNotifierProvider<WordbookInfoViewModel, WordbookInfo>((ref) {
  return WordbookInfoViewModel();
});
