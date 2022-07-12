// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notion_wordbook/viewmodels/loading_controller.dart';
// 🌎 Project imports:
import 'package:notion_wordbook/viewmodels/wordbook_info.dart';
import 'package:notion_wordbook/widgets/custom_button.dart';
import 'package:notion_wordbook/widgets/custom_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectingPage extends StatelessWidget {
  final _focusNode = FocusNode();
  final apiKeyController = TextEditingController();
  final dbIDController = TextEditingController();

  ConnectingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Focus(
        focusNode: _focusNode,
        child: GestureDetector(
          onTap: _focusNode.requestFocus,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Notionと連携'),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
                child: Column(
                  children: [
                    CustomTextField(
                      labelName: 'APIKeyを入力',
                      controller: apiKeyController,
                      obscure: true,
                    ),
                    CustomTextField(
                      labelName: 'DBのIDを入力',
                      controller: dbIDController,
                      obscure: true,
                    ),
                    ConnectButton(
                      apiKeyController: apiKeyController,
                      dbIDController: dbIDController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () async {
                          await launch(
                            'https://torkralle.notion.site/Notion-Wordbook-d93132a576d846b0b3b5c10aa0c24908',
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          color: Theme.of(context).colorScheme.surface,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    children: const [
                                      TextSpan(
                                        text: 'API',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: 'や'),
                                      TextSpan(
                                        text: 'DB',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: 'のキーが分からない方はこちら'),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.launch_outlined,
                                color: Theme.of(context).colorScheme.onSurface,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class ConnectButton extends HookConsumerWidget {
  const ConnectButton({
    Key? key,
    required this.apiKeyController,
    required this.dbIDController,
  }) : super(key: key);
  final TextEditingController apiKeyController, dbIDController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AbsorbPointer(
      // ローディング中はボタンタップを無効化する
      absorbing: ref.watch(loadingNotifierProvider),
      child: InkWell(
        onTap: () async {
          // ロード中だよ
          ref.read(loadingNotifierProvider.notifier).start();
          DBStatus _dbStatus =
              await ref.read(wordbookInfoProvider.notifier).setDBInfo(
                    apiKeyController.text,
                    dbIDController.text,
                  );
          // ロード終わったよ
          ref.read(loadingNotifierProvider.notifier).stop();
          if (_dbStatus.status == Status.error) {
            // 連携失敗のメッセージ
            connectionResultMessage(context, _dbStatus);
          } else {
            // 連携成功のメッセージ
            connectionResultMessage(context, null);
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
            // ページ遷移につき初期化することで次回の入力の時にデータが残っていることを防ぐ。
            ref.read(wordbookInfoProvider.notifier).updateDBInfo('', '', '');
          }
        },
        child: const CustomButton(
          buttonLabel: '連携',
        ),
      ),
    );
  }

  connectionResultMessage(BuildContext context, DBStatus? dbStatus) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: dbStatus != null
            ? Text(
                '通信が失敗したか入力されたDB情報が間違っています。 ${dbStatus.description!}',
              )
            : const Text('連携が成功しました。'),
      ),
    );
  }
}
