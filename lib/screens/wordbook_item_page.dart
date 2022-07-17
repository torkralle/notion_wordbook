// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_wordbook/objects/models/word.dart';
import 'package:notion_wordbook/viewmodels/word_list_controller.dart';

class WordBookItemPage extends HookConsumerWidget {
  const WordBookItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(wordsListProvider.notifier).initState();
        return null;
      },
      <Object>[],
    );
    final List<Word> wordsList = ref.watch(wordsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('単語帳'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: wordsList.length,
            itemBuilder: (BuildContext context, int index) {
              return WordCard(index: index, words: wordsList);
            },
          ),
        ),
      ),
    );
  }
}

class WordCard extends StatelessWidget {
  const WordCard({
    Key? key,
    required this.index,
    required this.words,
  }) : super(key: key);

  final int index;
  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            words[index].spelling,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              words[index].meaning ?? '',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          leading: const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Icon(
              Icons.circle_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
