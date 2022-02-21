// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('マイページ'),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(
                      image: NetworkImage(
                          'https://photoria.jp/wp-content/uploads/2019/07/02-2L-1.jpg'),
                    ),
                  ),
                  Text('ほしこ'),
                ],
              ),
              const IconText(icon: Icon(Icons.settings), listName: '設定'),
              const IconText(icon: Icon(Icons.notifications), listName: 'お知らせ'),
              const IconText(
                  icon: Icon(Icons.contact_support_outlined),
                  listName: 'お問い合わせ'),
              const IconText(
                  icon: Icon(Icons.format_list_bulleted), listName: '利用規約'),
            ],
          ),
        ),
      );
}

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.icon,
    required this.listName,
  }) : super(key: key);

  final Icon icon;
  final String listName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          const SizedBox(width: 8),
          Text(listName),
        ],
      ),
    );
  }
}
