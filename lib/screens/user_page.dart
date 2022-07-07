// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:notion_wordbook/widgets/header.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const HeaderBar(title: 'マイページ'),
        body: Container(
          margin: const EdgeInsets.only(top: 60, left: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://ca.slack-edge.com/T02PHQ48CBC-U02PL2L6804-7e740657a6c3-512',
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'ほしこ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const IconText(
                icon: Icon(Icons.settings_outlined),
                listName: '設定',
              ),
              const IconText(
                icon: Icon(Icons.notifications_none),
                listName: 'お知らせ',
              ),
              const IconText(
                icon: Icon(Icons.contact_support_outlined),
                listName: 'お問い合わせ',
              ),
              const IconText(
                icon: Icon(Icons.format_list_bulleted),
                listName: '利用規約',
              ),
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
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/wordbook_item');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon,
            const SizedBox(width: 10),
            Text(
              listName,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
