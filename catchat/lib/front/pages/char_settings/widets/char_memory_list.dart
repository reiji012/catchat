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
      decoration: BoxDecoration(
        color: Color(NyatColors.backgroundColor),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'あなたとの思い出',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: memoryList.entries.map((entry) {
              return ProfileField(title: entry.key, initialValue: entry.value);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String title;
  final String initialValue;

  const ProfileField({
    required this.title,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: TextEditingController(text: initialValue),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
