// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 10,
          title: const Text(
            '単語帳一覧',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          backgroundColor: Colors.purple[800],
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 60),
          // alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                  color: const Color.fromARGB(255, 233, 225, 240),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '単語帳を追加',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const WordBookItem(rank: 'A', listName: 'はじめての英語', ratio: '23.4'),
              const WordBookItem(rank: 'B', listName: '基礎からの英語', ratio: '78.2'),
              const WordBookItem(rank: 'A', listName: '高校英語', ratio: '45.3'),
              const WordBookItem(rank: 'C', listName: '日常英語', ratio: '1.1'),
            ],
          ),
        ),
      );
}

class WordBookItem extends StatelessWidget {
  const WordBookItem({
    Key? key,
    required this.rank,
    required this.listName,
    required this.ratio,
  }) : super(key: key);

  final String rank;
  final String listName;
  final String ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(234, 255, 250, 254),
        border: Border.all(color: Colors.black, width: 0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 14),
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.purple[800], shape: BoxShape.circle),
            child: Column(
              children: [
                Text(
                  rank,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    listName,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text('前回正答率'),
                    const SizedBox(width: 8.0),
                    Row(
                      children: [
                        Text(ratio),
                        const Text('%'),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}

// class MyPageScreen extends StatelessWidget {
//   const MyPageScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           toolbarHeight: 80,
//           elevation: 10,
//           title: const Text(
//             'マイページ',
//             style: TextStyle(
//               fontSize: 27,
//             ),
//           ),
//           backgroundColor: Colors.purple[800],
//         ),
//         body: Container(
//           margin: const EdgeInsets.only(top: 60, left: 35),
//           // alignment: Alignment.center,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 50),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(right: 20),
//                       height: 70,
//                       width: 70,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: NetworkImage(
//                               'https://ca.slack-edge.com/T02PHQ48CBC-U02PL2L6804-7e740657a6c3-512'),
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       'ほしこ',
//                       style: TextStyle(
//                         fontSize: 25,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const WordBookItem(
//                   icon: Icon(Icons.settings_outlined), listName: '設定'),
//               const WordBookItem(
//                   icon: Icon(Icons.notifications_none), listName: 'お知らせ'),
//               const WordBookItem(
//                   icon: Icon(Icons.contact_support_outlined),
//                   listName: 'お問い合わせ'),
//               const WordBookItem(
//                   icon: Icon(Icons.format_list_bulleted), listName: '利用規約'),
//             ],
//           ),
//         ),
//       );
// }

// class WordBookItem extends StatelessWidget {
//   const WordBookItem({
//     Key? key,
//     required this.icon,
//     required this.listName,
//   }) : super(key: key);

//   final Icon icon;
//   final String listName;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           icon,
//           const SizedBox(width: 10),
//           Text(
//             listName,
//             style: const TextStyle(
//               fontSize: 25,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
