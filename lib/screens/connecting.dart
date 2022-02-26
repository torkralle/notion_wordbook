// 🐦 Flutter imports:
import 'package:flutter/material.dart';

bool _isObscure = true;

class ConnectingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
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
        body: Container(
          margin: const EdgeInsets.only(top: 60, left: 30),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: const [
              InputDecorator(labelName: 'API Key'),
              InputDecorator(labelName: 'DB Key'),
              Text('APIやDBのキーが分からない方はこちら')
              // pageを飛ぶicon
            ],
          ),
        ),
      );
}

class InputDecorator extends StatelessWidget {
  const InputDecorator({
    Key? key,
    required this.labelName,
  }) : super(key: key);

  final String labelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          labelName + 'を入力',
          style: const TextStyle(
            backgroundColor: Colors.blue,
            fontSize: 28,
          ),
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
            labelText: labelName,
            labelStyle: const TextStyle(fontSize: 16),
            // The MaterialStateProperty's value is a text style that is orange
            // by default, but the theme's error color if the input decorator
            // is in its error state.
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).errorColor
                  : Colors.purple;
              return TextStyle(color: color, fontSize: 20, letterSpacing: 1.3);
            }),
            suffixIcon: IconButton(
              onPressed: () {
                _isObscure = !_isObscure;
              },
              icon: Icon(_isObscure
                  ? Icons.visibility_off
                  : Icons.visibility), //icon切り替え
              color: const Color.fromARGB(160, 0, 0, 0),
            ),
          ),
          validator: (String? value) {
            if (value == null || value == '') {
              return 'Enter ' + labelName;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.always,
        ),
      ],
    );
  }
}

//       // アイコンがタップされたら現在と反対の状態をセットする
//       onPressed: () {
//         // setState(() {
//         _isObscure = !_isObscure;
//         // });
//       },
