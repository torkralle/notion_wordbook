import 'package:flutter/material.dart';

class ResultListItem extends StatelessWidget {
  const ResultListItem({
    Key? key,
    required this.word,
    required this.meaning,
    required this.isMissed,
  }) : super(key: key);

  final String word;
  final String meaning;
  final bool isMissed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    word,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      meaning,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              isMissed ? 'MISS!!' : 'OK!',
              style: TextStyle(
                color: isMissed
                    ? const Color.fromRGBO(160, 0, 0, 1)
                    : const Color.fromARGB(255, 119, 0, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
