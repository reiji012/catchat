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
class ChatPage extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();
  ChatPage({super.key});

  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MessageListState messageListState =
        ref.watch(messageListStateNotifierProvider);

    final isLoading = messageListState.isLoading;
    final messages = messageListState.messageList;
    TextEditingController _textEditingController = TextEditingController();

    // メッセージリストが更新されるたびにスクロールを一番下に移動
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isLoading) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(NyatColors.backgroundColor),
        ),
        child: Stack(
          children: [
            Column(
              verticalDirection: VerticalDirection.up,
              children: [
                Container(),
              ],
            ),
            Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                actions: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.av_timer_outlined),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
                leading: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              body: isLoading
                  ? loading()
                  : SafeArea(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Column(
                            children: <Widget>[
                              Expanded(
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: messages.length,
                                  itemBuilder: (context, index) {
                                    final message = messages[index];
                                    return buildMessageTile(
                                      message,
                                      ref,
                                    ); // メッセージタイルを構築するメソッド
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: TextField(
                                          controller: _textEditingController,
                                          decoration: InputDecoration(
                                            hintText: 'メッセージを入力',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Color(
                                            NyatColors.userChatBubbleColor),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.send,
                                            color: Colors.white),
                                        onPressed: () {
                                          final userId = ref
                                              .read(userStateNotifierProvider)
                                              .userId;
                                          ref
                                              .read(
                                                  messageListStateNotifierProvider
                                                      .notifier)
                                              .sendMessage(
                                                  userId: userId,
                                                  content:
                                                      _textEditingController
                                                          .text);
                                          _textEditingController.clear();
                                          // きーぼーどを閉じる
                                          FocusScope.of(context).unfocus();

                                          // アニメーション付きでスクロールの最下部に移動
                                          _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOut,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessageTile(MessageModel message, WidgetRef ref) {
    final CatState catState = ref.watch(catStateNotifierProvider);
    return ListTile(
      leading: message.from == "user"
          ? null
          : CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  catState.imageUrl,
                  fit: BoxFit.fill,
                  width: 100.0, // CircleAvatarのサイズに合わせる
                  height: 100.0, // CircleAvatarのサイズに合わせる
                ),
              ),
            ),
      title: Align(
        alignment: message.from == 'user'
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: message.from == 'user'
                ? Color(NyatColors.userChatBubbleColor)
                : Color(NyatColors.aiChatBubbleColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: message.from == 'user'
                  ? Radius.circular(20.0)
                  : Radius.circular(0),
              bottomRight: message.from == 'user'
                  ? Radius.circular(0)
                  : Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3), // 影の位置を調整
              ),
            ],
          ),
          child: Text(
            message.content,
            style: TextStyle(
              color: message.from == 'user' ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

// ... existing code ...

  Widget loading() {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.white,
      size: 100,
    );
  }
}
