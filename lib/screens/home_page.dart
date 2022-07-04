// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(wordbookInfoListProvider.notifier).initState();
        return null;
      },
      [],
    );
    final wordbooks = ref.watch(wordbookInfoListProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 10,
        title: const Text(
          '単語帳一覧',
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        backgroundColor: Colors.purple[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 30),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/add_wordbook');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 90,
                  ),
                  color: const Color.fromARGB(255, 233, 225, 240),
                  child: const Text(
                    '単語帳を追加',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: wordbooks.length,
              itemBuilder: (BuildContext context, index) {
                return BookCard(
                  index: index,
                  wordbooks: wordbooks,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends ConsumerWidget {
  const BookCard({
    Key? key,
    required this.index,
    required this.wordbooks,
  }) : super(key: key);

  final int index;
  final List<dynamic> wordbooks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 20,
      ),
      elevation: 2,
      color: const Color.fromARGB(234, 250, 241, 252),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          ref.read(maxPageProvider.notifier).getListLength();
          ref.read(wordbookInfoProvider.notifier).updateDBInfo(
                wordbooks[index]['db_name'],
                wordbooks[index]['api_key'],
                wordbooks[index]['db_id'],
              );
          ref.read(wordsListProvider.notifier).initState();
          Navigator.of(context).pushNamed('/quiz');
        },
        onLongPress: () {
          longPressDialog(context, ref);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              wordbooks[index]['db_name'],
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                '前回正答率' + wordbooks[index]['api_key'], // TODO: api_keyを暫定的に表示
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            leading: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Icon(
                Icons.circle_sharp,
                color: Colors.white,
                size: 20,
              ),
            ),
            trailing: InkWell(
              onTap: () {
                ref.read(wordbookInfoProvider.notifier).updateDBInfo(
                      wordbooks[index]['db_name'],
                      wordbooks[index]['api_key'],
                      wordbooks[index]['db_id'],
                    );
                Navigator.of(context).pushNamed('/wordbook_item');
              },
              child: const Icon(Icons.more_horiz),
            ),
          ),
        ),
      ),
    );
  }

  longPressDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            wordbooks[index]['db_name'],
            style: const TextStyle(
              fontSize: 27,
            ),
          ),
          children: <Widget>[
            // コンテンツ領域
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context); // TODO: 単語帳一覧を表示
                Navigator.of(context).pushNamed('/wordbook_item');
              },
              child: const Text('単語一覧'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context);
                await ref
                    .read(wordbookInfoListProvider.notifier)
                    .removeFromList(wordbooks[index]['api_key']);
              },
              child: const Text(
                '削除',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
