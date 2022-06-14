// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:notion_wordbook/helper/HexColor.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class LearningDataPage extends StatelessWidget {
  const LearningDataPage({Key? key}) : super(key: key);
  static const titleStrs = ["現在の連続日数","最長連続日数","学習した日数","覚えた単語数","累計学習単語数","本日の学習時間","合計学習時間"];
  static const unitStrs = ["日","日","日","単語","単語","秒","秒"];


  @override
  Widget build(BuildContext context) {
    final String newmoColor = "e3e3ed";
    final Size deviceSize = MediaQuery.of(context).size;
    //DBから取得
    var dataArr = [2,2,2,19,21,15,72];
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
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
                  "ハンバーガー $index",
                  style: TextStyle(color: Colors.black87),
                ),
              );
            },
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 10,
          title: const Text(
            '学習データ',
            style: TextStyle(fontSize: 27, color: Colors.black87),
          ),
          backgroundColor: HexColor(newmoColor),
        ),
        body:Container(
          alignment: Alignment.bottomCenter,
          color: HexColor(newmoColor),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children:[
                  SizedBox(width: 20),
                  Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 10,
                        lightSource: LightSource.topLeft,
                        color: HexColor(newmoColor)
                    ),
                    child:  Container(
                      padding: EdgeInsets.all(20),
                      width: deviceSize.width/2-30,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(titleStrs[0],style: TextStyle(fontSize: 17),),
                          Text("${dataArr[0]} ${unitStrs[0]}",style: TextStyle(fontSize: 16))],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 10,
                        lightSource: LightSource.topLeft,
                        color: HexColor(newmoColor)
                    ),
                    child:  Container(
                        padding: EdgeInsets.all(20),
                        width: deviceSize.width/2-30,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(titleStrs[1],style: TextStyle(fontSize: 17),),
                            Text("${dataArr[1]} ${unitStrs[1]}",style: TextStyle(fontSize: 16))],
                        )
                    ),
                  ),
                ],

              ),
              SizedBox(height: 30),
              Row(
                children:[
                  SizedBox(width: 20),
                  Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 10,
                        lightSource: LightSource.topLeft,
                        color: HexColor(newmoColor)
                    ),
                    child:  Container(
                      padding: EdgeInsets.all(20),
                      width: deviceSize.width/2-30,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(titleStrs[2],style: TextStyle(fontSize: 17),),
                          Text("${dataArr[2]} ${unitStrs[2]}",style: TextStyle(fontSize: 16))],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 10,
                        lightSource: LightSource.topLeft,
                        color: HexColor(newmoColor)
                    ),
                    child:  Container(
                        padding: EdgeInsets.all(20),
                        width: deviceSize.width/2-30,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(titleStrs[3],style: TextStyle(fontSize: 17),),
                            Text("${dataArr[3]} ${unitStrs[3]}",style: TextStyle(fontSize: 16))],
                        )
                    ),
                  ),
                ],

              ),
              SizedBox(height: 30),
              Row(
                children:[
                  SizedBox(width: 20),
                  Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 10,
                        lightSource: LightSource.topLeft,
                        color: HexColor(newmoColor)
                    ),
                    child:  Container(
                      padding: EdgeInsets.all(20),
                      width: deviceSize.width/2-30,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(titleStrs[4],style: TextStyle(fontSize: 17),),
                          Text("${dataArr[4]} ${unitStrs[4]}",style: TextStyle(fontSize: 16))],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 10,
                        lightSource: LightSource.topLeft,
                        color: HexColor(newmoColor)
                    ),
                    child:  Container(
                      padding: EdgeInsets.all(20),
                      width: deviceSize.width/2-30,
                      height: 100,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(titleStrs[5],style: TextStyle(fontSize: 17),),
                            Text("${dataArr[5]} ${unitStrs[5]}",style: TextStyle(fontSize: 16))],
                        )
                    ),
                  ),
                ],

              ),
              SizedBox(height: 30),
              Row(
                children:[
                  SizedBox(width: 20),
                  Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                            depth: 10,
                            lightSource: LightSource.topLeft,
                            color: HexColor(newmoColor)
                        ),
                        child:  Container(
                          padding: EdgeInsets.all(20),
                          width: deviceSize.width-40,
                          height: 100,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text(titleStrs[6],style: TextStyle(fontSize: 17),),
                            Text("${dataArr[6]} ${unitStrs[6]}",style: TextStyle(fontSize: 16))],
                          ),
                        ),
                      )

                ],

              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );


  }
}
