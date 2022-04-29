// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';
import 'package:notion_wordbook/widgets/custom_textfield.dart';

class AddWordbookPage extends HookConsumerWidget {
  AddWordbookPage({Key? key}) : super(key: key);

  final _focusNode = FocusNode();
  final dbNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Focus(
      focusNode: _focusNode,
      child: GestureDetector(
        onTap: _focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 80,
            elevation: 10,
            title: const Text(
              'Notionと連携',
              style: TextStyle(
                fontSize: 27,
              ),
            ),
            backgroundColor: Colors.purple[800],
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
              child: Column(
                children: [
                  CustomTextField(
                    labelName: '新しく追加する\n単語帳名を入力',
                    controller: dbNameController,
                    obscure: false,
                  ),
                  InkWell(
                    onTap: () {
                      ref
                          .read(wordbookInfoProvider.notifier)
                          .setDBName(dbNameController.text);
                      Navigator.of(context).pushNamed('/connecting');
                    },
                    child: Container(
                      color: Colors.purple[600],
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 25,
                      ),
                      child: const Text(
                        '次へ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
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
