import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class StatBox extends StatelessWidget {
  const StatBox({
    Key? key,
    required this.isLarge,
    required this.title,
    required this.stat,
    required this.unit,
  }) : super(key: key);
  final bool isLarge;
  final String title;
  final int stat;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 10,
          lightSource: LightSource.topLeft,
          color: const Color(0xffe3e3ed),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: isLarge ? deviceSize.width - 40 : deviceSize.width / 2 - 30,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                '$stat $unit',
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
