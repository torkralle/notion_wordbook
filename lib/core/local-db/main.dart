// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final todoRepository = StateProvider.autoDispose<TodoRepository>(
    (ref) => TodoRepositoryImpl(ref.read),);

abstract class TodoRepository {
  Future<String> getTodoList();
  Future<void> saveTodoList(String todoList);
}

const _todoListKey = 'todoListKey';

class TodoRepositoryImpl implements TodoRepository {
  final Reader _read;
  TodoRepositoryImpl(this._read);

  @override
  Future<String> getTodoList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final list = prefs.getString(_todoListKey) ?? '';
    return list;
  }

  @override
  Future<void> saveTodoList(String todoList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_todoListKey, todoList);
  }
}
