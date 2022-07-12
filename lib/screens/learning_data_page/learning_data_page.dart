// 🐦 Flutter imports:
//import 'package:notion_wordbook/helper/HexColor.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:notion_wordbook/screens/learning_data_page/stat_box.dart';

//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: const NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
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
          backgroundColor: const Color(0xffe3e3ed),
        ),
        body: Container(
          alignment: Alignment.center,
          color: const Color(0xffe3e3ed),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    StatBox(
                      isLarge: false,
                      title: titleStrs[0],
                      stat: dataArr[0],
                      unit: unitStrs[0],
                    ),
                    StatBox(
                      isLarge: false,
                      title: titleStrs[1],
                      stat: dataArr[1],
                      unit: unitStrs[1],
                    ),
                  ],
                ),
                Row(
                  children: [
                    StatBox(
                      isLarge: false,
                      title: titleStrs[2],
                      stat: dataArr[2],
                      unit: unitStrs[2],
                    ),
                    StatBox(
                      isLarge: false,
                      title: titleStrs[3],
                      stat: dataArr[3],
                      unit: unitStrs[3],
                    ),
                  ],
                ),
                Row(
                  children: [
                    StatBox(
                      isLarge: false,
                      title: titleStrs[4],
                      stat: dataArr[4],
                      unit: unitStrs[4],
                    ),
                    StatBox(
                      isLarge: false,
                      title: titleStrs[5],
                      stat: dataArr[5],
                      unit: unitStrs[5],
                    ),
                  ],
                ),
                Row(
                  children: [
                    StatBox(
                      isLarge: true,
                      title: titleStrs[6],
                      stat: dataArr[6],
                      unit: unitStrs[6],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
