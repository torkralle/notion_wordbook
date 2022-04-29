// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget with PreferredSizeWidget {
  const HeaderBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 80,
      elevation: 10,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 27,
        ),
      ),
      backgroundColor: Colors.purple[800],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
