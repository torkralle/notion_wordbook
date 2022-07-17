// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_wordbook/viewmodels/load_state_controller.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_choices_controller.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';
import 'package:notion_wordbook/widgets/padding.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(wordbookInfoListProvider.notifier).initState();
        return null;
      },
      <Object>[],
    );
    final List<dynamic> wordbooks = ref.watch(wordbookInfoListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('単語帳一覧'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: topPadding,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/add_wordbook');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 88,
                  ),
                  color: const Color.fromARGB(255, 233, 225, 240),
                  child: Text(
                    '単語帳を追加',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: wordbooks.length,
              itemBuilder: (BuildContext context, int index) {
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
    if (ref.read(loadingStateProvider)) {
      return const CircularProgressIndicator();
    } else {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
            ref.watch(loadingStateProvider.notifier).update(true);
            ref.read(maxPageProvider.notifier).getListLength();
            ref.read(wordbookInfoProvider.notifier).updateDBInfo(
                  wordbooks[index]['db_name'],
                  wordbooks[index]['api_key'],
                  wordbooks[index]['db_id'],
                );
            await ref.read(wordsListProvider.notifier).initState();
            const int firstPage = 1;
            ref.read(wordChoicesProvider.notifier).setRandomChoices(firstPage);
            Navigator.of(context).pushNamed('/quiz');
            ref.watch(loadingStateProvider.notifier).update(false);
          },
          onLongPress: () {
            longPressDialog(context, ref);
          },
          child: Padding(
            padding: smallPadding,
            child: ListTile(
              title: Text(
                wordbooks[index]['db_name'],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '前回正答率 ${wordbooks[index]['api_key']}', // TODO: api_keyを暫定的に表示
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              leading: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Icon(
                  Icons.circle_sharp,
                  color: Colors.white,
                  size: 24,
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
  }

  void longPressDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            wordbooks[index]['db_name'],
            style: Theme.of(context).textTheme.titleLarge,
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
