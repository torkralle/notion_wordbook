// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';

class AddWordbookPage extends StatelessWidget {
  AddWordbookPage({Key? key}) : super(key: key);

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) => Focus(
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
                margin:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
                child: Column(
                  children: [
                    const WordbookNameField(labelName: '単語帳名'),
                    InkWell(
                      onTap: () {
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

class WordbookNameField extends HookConsumerWidget {
  const WordbookNameField({
    Key? key,
    required this.labelName,
  }) : super(key: key);

  final String labelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              '新しく追加する\n$labelNameを入力',
              style: const TextStyle(
                fontSize: 27,
              ),
            ),
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[\\.\\,\\ ]'))
            ],
            onChanged: (text) {
              ref.read(wordbookInfoProvider.notifier).setDBName(text);
              // print(text);
              // ref.read(dbNameProvider.notifier).setDBName(text);
            },
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              labelText: labelName,
              labelStyle: const TextStyle(fontSize: 16),
              floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.error)
                    ? Theme.of(context).errorColor
                    : Colors.purple;
                return TextStyle(color: color, fontSize: 20);
              }),
            ),
            validator: (String? value) {
              if (value == null || value == '') {
                return 'Enter $labelName';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.always,
          ),
        ],
      ),
    );
  }
}
