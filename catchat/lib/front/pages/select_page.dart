import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nyat選択'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0, // 画像の高さに合わせて調整
          // PageView.builderを使用
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.8), // 画像が中央に来るように調整
            itemCount: 9, // 画像の数
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0), // 画像間のマージン
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/images/cats/cat${index + 1}.png',
                    ), // 画像のパスを指定
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            // 決定ボタンの処理をここに書く
            Navigator.pushNamed(context, '/chat');
          },
          child: Text('お話しする'),
        ),
      ),
    );
  }
}
