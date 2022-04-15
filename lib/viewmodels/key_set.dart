// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notion_wordbook/objects/models/notion_key.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:notion_wordbook/core/local-db/main.dart';

class SharedPreferencesNotifier extends StateNotifier<String> {
  SharedPreferencesNotifier() : super('');

  Future<void> initState() async {
    await getValue();
  }

  Future setValue(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('value', value);
    state = value;
  }

  Future getValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final apiKey = prefs.getString('value') ?? '';
    state = apiKey;
  }
}

final sharedPreferencesProvider =
    StateNotifierProvider<SharedPreferencesNotifier, String>((ref) {
  return SharedPreferencesNotifier();
});

// ref.watch(sharePreferencesProvider.notifier).setValue('hogehoge');

class NotionKeySetViewModel extends StateNotifier<NotionKeySet> {
  NotionKeySetViewModel() : super(const NotionKeySet('', ''));

  // void updateAPIKey(apiKey) => state = NotionKeySet(apiKey, state.dbID);
  // void updateDBID(dbID) => state = NotionKeySet(state.apiKey, dbID);
  // updateAPIKey(apiKey)

  Future<void> initState() async {
    await getAPIKey();
    await getDBID();
  }

  Future<void> getAPIKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final apiKey = prefs.getString('api_key') ?? '';
    state = NotionKeySet(apiKey, state.dbID);
  }

  Future<void> getDBID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final dbID = prefs.getString('db_id') ?? '';
    state = NotionKeySet(state.apiKey, dbID);
  }

  Future<void> updateAPIKey(apiKey) async {
    state = NotionKeySet(apiKey, state.dbID);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('api_key', apiKey);
  }

  Future<void> updateDBID(dbID) async {
    state = NotionKeySet(state.apiKey, dbID);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('db_id', dbID);
  }
}

final notionKeySetProvider =
    StateNotifierProvider<NotionKeySetViewModel, NotionKeySet>((ref) {
  return NotionKeySetViewModel();
});
