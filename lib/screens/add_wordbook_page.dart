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
                    labelName: '新しく追加する\n単語帳名を入力',
                    controller: dbNameController,
                    obscure: false,
                  ),
                  InkWell(
                    onTap: () {
                      if (dbNameController.text.isEmpty) {
                        return;
                      }
                      ref
                          .read(wordbookInfoProvider.notifier)
                          .setDBName(dbNameController.text);
                      dbNameController.clear();
                      Navigator.of(context).pushNamed('/connecting');
                    },
                    child: const CustomButton(
                      buttonLabel: '次へ',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
