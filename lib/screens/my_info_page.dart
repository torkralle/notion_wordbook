// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          shape: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 228, 228, 228),
              // width: 1.5,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 40,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'テスト結果',
            style: TextStyle(color: Colors.black, fontSize: 27),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  '本日の総学習単語',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Text('2👉12単語'),
              const Text('10/10'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('もう一回テストする！'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('もう一回テストする！'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('もう一回テストする！'),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
