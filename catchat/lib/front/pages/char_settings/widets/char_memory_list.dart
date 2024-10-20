import 'package:catchat/front/theme/theme_color.dart';
import 'package:catchat/state/providers.dart';
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
    final user = ref.watch(userStateNotifierProvider);
    var memoryList = user.userInfo;

    return Container(
      color: Color(NyatColors.backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: memoryList.entries.map((entry) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0), // 画像間のマージン
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(entry.value['content'] ?? ''),
                Text(entry.value['value'] ?? ''),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
