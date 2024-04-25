import 'package:catchat/front/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'front/pages/select_page.dart'; // SelectPageをインポート
import 'front/pages/start.dart'; // StartPageをインポート

void main() {
  runApp(const MyApp());
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
