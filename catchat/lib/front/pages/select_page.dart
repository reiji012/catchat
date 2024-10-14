import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('とらまる'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.symmetric(horizontal: 10.0), // 画像間のマージン
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    'assets/images/cats/cat9.png',
                  ), // 画像のパスを指定
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Container(
            height: 40,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                // 決定ボタンの処理をここに書く
                Navigator.pushNamed(context, '/chat');
              },
              child: Text('お話しする'),
            ),
          ),
          Container(
            height: 40,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                // 決定ボタンの処理をここに書く
                Navigator.pushNamed(context, '/char_settings');
              },
              child: Text('お着替えする'),
            ),
          ),
        ],
      ),
    );
  }
}
