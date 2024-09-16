import 'package:catchat/front/theme/theme_color.dart';
import 'package:catchat/repositories/message_repository/model/message.dart';
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

class _CharSettingsPageState extends ConsumerState<CharSettingsPage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 3, vsync: this);
    final Size size = MediaQuery.of(context).size;

    TextEditingController _textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('とらまる'),
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
                    'assets/images/cats/cat2.png',
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
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                label: Text('とらまる'),
                hintText: 'ニックネームを入力してください',
              ),
            ),
          ),
          Container(
            height: 40,
          ),
          TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.cloud_outlined)),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _gridView(),
                _gridView(),
                _gridView(),
              ],
            ),
          )
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
