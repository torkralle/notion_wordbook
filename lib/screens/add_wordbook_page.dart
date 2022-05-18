// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';
import 'package:notion_wordbook/widgets/custom_button.dart';
import 'package:notion_wordbook/widgets/custom_textfield.dart';
import 'package:notion_wordbook/widgets/header.dart';

class AddWordbookPage extends HookConsumerWidget {
  AddWordbookPage({Key? key}) : super(key: key);

  final _focusNode = FocusNode();
  final dbNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbName = ref.watch(wordbookInfoProvider);
    useEffect(
      () {
        dbNameController.text =
            ref.read(wordbookInfoProvider.notifier).getDBName();
        return null;
      },
      [dbName],
    );
    return Focus(
      focusNode: _focusNode,
      child: GestureDetector(
        onTap: _focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const HeaderBar(
            title: 'Notionと連携',
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
