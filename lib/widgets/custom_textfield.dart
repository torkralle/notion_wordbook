import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../viewmodels/toggle_password.dart';

class CustomTextField extends HookConsumerWidget {
  const CustomTextField({
    Key? key,
    required this.labelName,
    required this.controller,
    required this.obscure,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelName;
  final bool obscure;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscuritySwitch = ref.watch(obscuritySwitchProvider);
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  labelName,
                  style: const TextStyle(
                    fontSize: 27,
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: controller,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[\\.\\,\\ ]'))
            ],
            enableSuggestions: false,
            autocorrect: false,
            obscureText: obscuritySwitch,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              labelStyle: const TextStyle(fontSize: 16),
              floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.error)
                    ? Theme.of(context).errorColor
                    : Colors.purple;
                return TextStyle(color: color, fontSize: 20);
              }),
              suffixIcon: Visibility(
                visible: obscure,
                child: IconButton(
                  onPressed: () {
                    ref
                        .read(obscuritySwitchProvider.notifier)
                        .switchVisibility();
                  },
                  icon: Icon(
                    obscuritySwitch ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: const Color.fromARGB(160, 0, 0, 0),
                ),
              ),
            ),
            validator: (String? value) {
              if (value == null || value == '') {
                return '値を入力してください';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }
}
