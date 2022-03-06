// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/toggle_password.dart';

class ConnectingPage extends StatelessWidget {
  ConnectingPage({Key? key}) : super(key: key);

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
                    const KeyField(labelName: 'API Key'),
                    const KeyField(labelName: 'DB Key'),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: Container(
                        color: Colors.purple[600],
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 25),
                        child: const Text(
                          '連携',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/home');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          color: const Color.fromARGB(255, 233, 225, 240),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: [
                                    TextSpan(
                                        text: 'API',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'や'),
                                    TextSpan(
                                        text: 'DB',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'のキーが分からない方はこちら'),
                                  ],
                                ),
                              ),
                              const Icon(Icons.launch_outlined,
                                  color: Color.fromARGB(141, 0, 0, 0))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class KeyField extends ConsumerWidget {
  const KeyField({
    Key? key,
    required this.labelName,
  }) : super(key: key);

  final String labelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visiblitySwitch = ref.watch(visiblitySwitchProvider);
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 155, bottom: 20),
            child: Text(
              '$labelNameを入力',
              style: const TextStyle(
                fontSize: 27,
              ),
            ),
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[\\.\\,\\ ]'))
            ],
            enableSuggestions: false,
            autocorrect: false,
            obscureText: visiblitySwitch,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple)),
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
              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(visiblitySwitchProvider.notifier).switchVisiblity();
                },
                icon: Icon(
                    visiblitySwitch ? Icons.visibility : Icons.visibility_off),
                color: const Color.fromARGB(160, 0, 0, 0),
              ),
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
