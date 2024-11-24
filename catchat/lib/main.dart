import 'package:catchat/front/pages/app_settings/app_settings_page.dart';
import 'package:catchat/front/pages/char_settings/char_settings_page.dart';
import 'package:catchat/front/pages/chat_page/chat_page.dart';
import 'package:catchat/front/theme/theme_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'front/pages/select_page.dart'; // SelectPageをインポート
import 'front/pages/start.dart'; // StartPageをインポート
import 'package:catchat/config/development.dart'; // 開発環境用の設定をインポート

void main() async {
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp();

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
        scaffoldBackgroundColor: Color(NyatColors.backgroundColor),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(NyatColors.backgroundColor),
        ),
        primaryColor: Color(NyatColors.backgroundColor),
        primaryTextTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: TextStyle(color: Colors.white),
            ),
      ),
      home: const SelectPage(),
      routes: {
        '/select': (context) => const SelectPage(), // SelectPageへのルートを定義
        '/chat': (context) => ChatPage(), // ChatPageへのルートを定義
        '/char_settings': (context) => CharSettingsPage(),
        '/app_settings': (context) => AppSettingsPage(),
      },
    );
  }
}
