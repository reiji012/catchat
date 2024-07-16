import 'package:catchat/front/pages/chat_page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'front/pages/select_page.dart'; // SelectPageをインポート
import 'front/pages/start.dart'; // StartPageをインポート
import 'package:catchat/config/development.dart'; // 開発環境用の設定をインポート

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catchat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(title: 'Catchat Home Page'),
      routes: {
        '/select': (context) => const SelectPage(), // SelectPageへのルートを定義
        '/chat': (context) => ChatPage(), // ChatPageへのルートを定義
      },
    );
  }
}
