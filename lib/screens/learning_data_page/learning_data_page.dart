import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notion_wordbook/screens/learning_data_page/stat_box.dart';

class LearningDataPage extends StatelessWidget {
  const LearningDataPage({Key? key}) : super(key: key);
  static const titleStrs = [
    '現在の連続日数',
    '最長連続日数',
    '学習した日数',
    '覚えた単語数',
    '累計学習単語数',
    '本日の学習時間',
    '合計学習時間'
  ];
  static const unitStrs = ['日', '日', '日', '単語', '単語', '秒', '秒'];
  @override
  Widget build(BuildContext context) {
    //const String newmoColor = 'ffe3e3ed';
    //TODO: DBから取得
    var dataArr = [2, 2, 2, 19, 21, 15, 72];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      home: Scaffold(
        drawer: Drawer(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  'ハンバーガー $index',
                  style: const TextStyle(color: Colors.black87),
                ),
              );
            },
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black87),
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 10,
          title: const Text(
            '学習データ',
            style: TextStyle(fontSize: 27, color: Colors.black87),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          color: Colors.white,
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                for (int i = 0; i < 7; i++)
                  StaggeredGridTile.count(
                    crossAxisCellCount: (i ~/ 6 + 1) * 3,
                    mainAxisCellCount: 2,
                    child: StatBox(
                      isLarge: false,
                      title: titleStrs[i],
                      stat: dataArr[i],
                      unit: unitStrs[i],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
