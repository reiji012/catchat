import 'package:catchat/front/pages/char_settings/widets/char_memory_list.dart';
import 'package:catchat/front/pages/char_settings/widets/item_selecter.dart';
import 'package:catchat/front/pages/char_settings/widets/visual_selecter.dart';
import 'package:catchat/front/theme/theme_color.dart';
import 'package:catchat/repositories/message_repository/model/message.dart';
import 'package:catchat/state/cat/cat_state.dart';
import 'package:catchat/state/massage_list/message_list_state.dart';
import 'package:catchat/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable

class CharSettingsPage extends ConsumerStatefulWidget {
  CharSettingsPage({super.key});

  @override
  _CharSettingsPageState createState() => _CharSettingsPageState();
}

class _CharSettingsPageState extends ConsumerState<CharSettingsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CatState catState = ref.watch(catStateNotifierProvider);

    TextEditingController _textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(catState.name),
      ),
      backgroundColor: Color(NyatColors.backgroundColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.symmetric(horizontal: 10.0), // 画像間のマージン
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    catState.imageUrl,
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
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      label: Text(catState.name),
                      hintText: 'ニックネームを入力してください',
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(catStateNotifierProvider.notifier).changeName(
                            _textEditingController.text,
                          );
                    },
                    child: Text('変更'),
                  ),
                ),
              ],
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
                showModalBottomSheet(
                    //モーダルの背景の色、透過
                    backgroundColor: Colors.transparent,
                    //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          margin: EdgeInsets.only(top: 64),
                          decoration: BoxDecoration(
                            //モーダル自体の色
                            color: Colors.white,
                            //角丸にする
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: VisualSelecter());
                    });
              },
              child: Text('見た目を変える'),
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
                showModalBottomSheet(
                    //モーダルの背景の色、透過
                    backgroundColor: Colors.transparent,
                    //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.only(top: 64),
                        decoration: BoxDecoration(
                          //モーダル自体の色
                          color: Colors.white,
                          //角丸にする
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Container(),
                      );
                    });
              },
              child: Text('性格を変える'),
            ),
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                // 決定ボタンの処理をここに書く
                showModalBottomSheet(
                    //モーダルの背景の色、透過
                    backgroundColor: Colors.transparent,
                    //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.only(top: 64),
                        decoration: BoxDecoration(
                          //モーダル自体の色
                          color: Colors.white,
                          //角丸にする
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: CharMemoryList(),
                      );
                    });
              },
              child: Text('とらまるが覚えたあなたのこと'),
            ),
          ),
        ],
      ),
    );
  }
  // ... existing code ...
}

Widget _gridView() {
  return GridView.count(crossAxisCount: 4, children: [
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    ),
  ]);
}
