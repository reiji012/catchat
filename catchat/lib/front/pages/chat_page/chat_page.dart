import 'package:catchat/front/theme/theme_color.dart';
import 'package:catchat/repositories/message_repository/model/message.dart';
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

  // @override
  // ConsumerStatefulElement createElement() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _scrollToBottom();
  //   });

  //   return super.createElement();
  // }

  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent - 5);
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
      backgroundColor: Color(NyatColors.backgroundColor),
      appBar: AppBar(title: Text("とらまるとお話し")),
      body: isLoading
          ? loading()
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return buildMessageTile(message); // メッセージタイルを構築するメソッド
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: "メッセージを入力...",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          ref
                              .read(messageListStateNotifierProvider.notifier)
                              .sendMessage(_textEditingController.text);
                          _textEditingController.clear();
                          // きーぼーどを閉じる
                          FocusScope.of(context).unfocus();

                          // アニメーション付きでスクロールの最下部に移動
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildMessageTile(MessageModel message) {
    return ListTile(
      leading: message.isMe
          ? null
          : CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/cats/image.png",
                  fit: BoxFit.cover,
                  width: 40.0, // CircleAvatarのサイズに合わせる
                  height: 40.0, // CircleAvatarのサイズに合わせる
                ),
              ),
            ),
      title: Align(
        alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: message.isMe
                ? Color(NyatColors.userChatBubbleColor)
                : Color(NyatColors.aiChatBubbleColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft:
                  message.isMe ? Radius.circular(20.0) : Radius.circular(0),
              bottomRight:
                  message.isMe ? Radius.circular(0) : Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3), // 影の位置を調整
              ),
            ],
          ),
          child: Text(
            message.content,
            style: TextStyle(
              color: message.isMe ? Colors.white : Colors.black,
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
