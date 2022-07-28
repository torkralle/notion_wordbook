// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_wordbook/viewmodels/load_state_controller.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/page_controllers.dart';
import 'package:notion_wordbook/viewmodels/word_choices_controller.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';
import 'package:notion_wordbook/widgets/padding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() => _loadWordList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadWordList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ref.read(wordbookInfoListProvider.notifier).getWordbookList(prefs);
  }

  @override
  Widget build(BuildContext context) {
    Future<void>.microtask(() => _loadWordList());

    final AsyncValue<List<dynamic>> wordbooks =
        ref.watch(wordbookInfoListProvider);
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
            wordbooks.when(
              data: (List<dynamic> data) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return BookCard(
                    index: index,
                    wordbooks: data,
                  );
                },
              ),
              error: (Object error, StackTrace? s) => Center(
                child: SizedBox(
                  height: 48,
                  child: Text(
                    'エラーが発生しました $error',
                  ),
                ),
              ),
              loading: () => const Center(
                heightFactor: 1,
                widthFactor: 1,
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BookCard extends ConsumerStatefulWidget {
  const BookCard({
    Key? key,
    required this.index,
    required this.wordbooks,
  }) : super(key: key);

  final int index;
  final List<dynamic> wordbooks;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookCardState();
}

class _BookCardState extends ConsumerState<BookCard> {
  @override
  Widget build(BuildContext context) {
    if (ref.read(loadingStateProvider)) {
      return const CircularProgressIndicator();
    } else {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
            ref.read(loadingStateProvider.notifier).update(true);
            ref.read(maxPageProvider.notifier).getListLength();
            ref.read(wordbookInfoProvider.notifier).updateDBInfo(
                  widget.wordbooks[widget.index]['db_name'],
                  widget.wordbooks[widget.index]['api_key'],
                  widget.wordbooks[widget.index]['db_id'],
                );
            await ref.read(wordsListProvider.notifier).initState();
            ref.read(currentPageProvider.notifier).initState();
            const int firstPage = 1;
            ref.read(wordChoicesProvider.notifier).setRandomChoices(firstPage);

            /// `context` が存在するか確認してから `Navigator.of(context)` を使うようにする。
            if (!mounted) return;
            Navigator.of(context).pushNamed('/quiz');
            ref.read(loadingStateProvider.notifier).update(false);
          },
          onLongPress: () {
            longPressDialog(context, ref);
          },
          child: Padding(
            padding: smallPadding,
            child: ListTile(
              title: Text(
                widget.wordbooks[widget.index]['db_name'],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '前回正答率 ${widget.wordbooks[widget.index]['api_key']}', // TODO: api_keyを暫定的に表示
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
                        widget.wordbooks[widget.index]['db_name'],
                        widget.wordbooks[widget.index]['api_key'],
                        widget.wordbooks[widget.index]['db_id'],
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
            widget.wordbooks[widget.index]['db_name'],
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
                    .removeFromList(widget.wordbooks[widget.index]['db_name']);
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
