// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_wordbook/objects/models/notion_key.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';
import 'package:notion_wordbook/widgets/custom_button.dart';
import 'package:notion_wordbook/widgets/custom_textfield.dart';
import 'package:notion_wordbook/widgets/padding.dart';
import 'package:notion_wordbook/viewmodels/loading_controller.dart';

class AddWordbookPage extends HookConsumerWidget {
  AddWordbookPage({Key? key}) : super(key: key);

  final FocusNode _focusNode = FocusNode();
  final TextEditingController dbNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WordbookInfo db = ref.read(wordbookInfoProvider);
    useEffect(
      () {
        dbNameController.text = db.dbName;
        return null;
      },
      <WordbookInfo>[db],
    );
    return Focus(
      focusNode: _focusNode,
      child: GestureDetector(
        onTap: _focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Notionと連携'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: nicePadding,
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    labelName: '新しく追加する\n単語帳名を入力\n(同名の単語帳は不可)',
                    controller: dbNameController,
                    obscure: false,
                  ),
                  NextButton(dbNameController: dbNameController)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NextButton extends ConsumerStatefulWidget {
  const NextButton({
    Key? key,
    required this.dbNameController,
  }) : super(key: key);
  final TextEditingController dbNameController;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NextButtonState();
}

class _NextButtonState extends ConsumerState<NextButton> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      // ローディング中はボタンタップを無効化する
      absorbing: ref.watch(loadingNotifierProvider),
      child: InkWell(
        onTap: () async {
          // ロード中だよ
          ref.read(loadingNotifierProvider.notifier).start();
          DBStatus dbStatus = await ref
              .read(wordbookInfoProvider.notifier)
              .setDBName(widget.dbNameController.text);
          // ロード終わったよ
          ref.read(loadingNotifierProvider.notifier).stop();
          if (dbStatus.status == Status.error) {
            // 連携失敗のメッセージ
            resultMessage(dbStatus);
          } else {
            // 連携成功のメッセージ
            resultMessage(null);

            /// `context` が存在するか確認してから `Navigator.of(context)` を使うようにする。
            if (!mounted) return;
            Navigator.of(context).pushNamed('/connecting');
            // ページ遷移につき初期化することで次回の入力の時にデータが残っていることを防ぐ。
            // ref.read(wordbookInfoProvider.notifier).updateDBInfo('', '', '');
          }
        },
        child: const CustomButton(
          buttonLabel: '次へ',
        ),
      ),
    );
  }

  void resultMessage(DBStatus? dbStatus) {
    /// `context` が存在するか確認してから `Navigator.of(context)` を使うようにする。
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: dbStatus != null
            ? Text(
                '不適切な単語帳名です。 ${dbStatus.description!}',
              )
            : const Text('続いてAPIキーとDBのIDを入力して下さい。'),
      ),
    );
  }
}
