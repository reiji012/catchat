import 'package:catchat/repositories/message_repository/model/message.dart';
import 'package:catchat/state/massage_list/message_list_state.dart';
import 'package:catchat/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class ChatPage extends ConsumerWidget {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.0);
  ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MessageListState messageListState =
        ref.watch(messageListStateNotifierProvider);
    final isLoading = messageListState.isLoading;
    final messages = messageListState.messageList;
    TextEditingController _textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("チャット")),
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
      leading: message.isMe ? null : CircleAvatar(child: Icon(Icons.person)),
      title: Align(
        alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: message.isMe ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(message.content,
              style:
                  TextStyle(color: message.isMe ? Colors.white : Colors.black)),
        ),
      ),
    );
  }

  Widget loading() {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.white,
      size: 100,
    );
  }
}
