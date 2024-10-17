import 'package:catchat/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisualSelecter extends ConsumerStatefulWidget {
  const VisualSelecter({super.key});

  @override
  ConsumerState<VisualSelecter> createState() => _VisualSelecterState();
}

class _VisualSelecterState extends ConsumerState<VisualSelecter> {
  @override
  Widget build(BuildContext context) {
    var pageController = PageController(viewportFraction: 0.5);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0, // 画像の高さに合わせて調整
          // PageView.builderを使用
          child: PageView.builder(
            controller: pageController, // 画像が中央に来るように調整
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
        ElevatedButton(
          onPressed: () {
            // 決定ボタンの処理をここに書く
            ref.read(catStateNotifierProvider.notifier).changeImageUrl(
                'assets/images/cats/cat${pageController.page!.round() + 1}.png');

            // ページを閉じる
            Navigator.pop(context);
          },
          child: Text('決定'),
        ),
      ],
    );
  }
}
