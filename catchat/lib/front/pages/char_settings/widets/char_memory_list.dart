import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharMemoryList extends ConsumerStatefulWidget {
  const CharMemoryList({super.key});

  @override
  ConsumerState<CharMemoryList> createState() => _CharMemoryListState();
}

class _CharMemoryListState extends ConsumerState<CharMemoryList> {
  @override
  Widget build(BuildContext context) {
    var memoryList = [
      {
        'content': 'ニックネーム',
        'value': 'まーぼー',
      },
      {
        'content': '性別',
        'value': '男',
      },
      {
        'content': '年齢',
        'value': '20代',
      },
      {
        'content': '趣味',
        'value': 'プログラミング',
      },
      {
        'content': '好きな食べ物',
        'value': 'ラーメン',
      },
      {
        'content': '好きなアニメ',
        'value': '鬼滅の刃',
      },
      {
        'content': '好きなゲーム',
        'value': 'モンスターハンター',
      },
      {
        'content': '好きな映画',
        'value': 'ハリーポッター',
      },
      {
        'content': '好きな音楽',
        'value': 'J-POP',
      },
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: memoryList.map((memory) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0), // 画像間のマージン
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(memory['content']!),
              Text(memory['value']!),
            ],
          ),
        );
      }).toList(),
    );
  }
}
