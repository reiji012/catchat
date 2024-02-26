import 'package:catchat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [
    Message(content: "こんにちは！", isMe: false),
    Message(content: "こんにちは、どうしていますか？", isMe: true),
    // ここにメッセージを追加...
    Message(content: "今日はどんな一日だった？", isMe: false),
    Message(content: "とても忙しかったよ。君は？", isMe: true),
    Message(content: "私もだよ。プロジェクトの締め切りが近いから。", isMe: false),
    Message(content: "それは大変だね。何か手伝えることはある？", isMe: true),
    Message(content: "ありがとう！でも、大丈夫。なんとかなるよ。", isMe: false),
    Message(content: "わかった。何かあったら言ってね。", isMe: true),
    Message(content: "うん、ありがとう！", isMe: false),
    Message(content: "最近、新しい趣味は始めた？", isMe: true),
    Message(content: "実は、写真を撮り始めたんだ。", isMe: false),
    Message(content: "それは面白そう！どんな写真を撮ってるの？", isMe: true),
    Message(content: "主に自然の風景や動物たち。外に出るのが好きになったよ。", isMe: false),
    Message(content: "素敵だね。私も外に出るのが好きだよ。", isMe: true),
    Message(content: "じゃあ、一緒に写真を撮りに行こうか。", isMe: false),
    Message(content: "いいね！楽しみにしてる。", isMe: true),
    Message(content: "どこかいい場所を知ってる？", isMe: false),
    Message(content: "うん、いくつかあるよ。後でリストを送るね。", isMe: true),
    Message(content: "ありがとう！楽しみにしてる。", isMe: false),
    Message(content: "いつも通り、週末がいいかな？", isMe: true),
    Message(content: "うん、週末がいいね。", isMe: false),
    Message(content: "じゃあ、計画を立てよう。", isMe: true),
    Message(content: "はい、よろしく！", isMe: false),
    Message(content: "最近読んだ本はある？", isMe: true),
    Message(content: "うん、面白い小説を読んだよ。", isMe: false),
    Message(content: "おお、どんな話？", isMe: true),
    Message(content: "未来の話で、人類が宇宙に住むようになるんだ。", isMe: false),
    Message(content: "面白そう！タイトルは何？", isMe: true),
    Message(content: "「星を継ぐもの」だよ。おすすめだから読んでみて。", isMe: false),
    Message(content: "ありがとう！チェックしてみるね。", isMe: true),
    Message(content: "どういたしまして！", isMe: false),
    Message(content: "最近、映画を見た？", isMe: true),
    Message(content: "うん、面白い映画を見たよ。", isMe: false),
    Message(content: "何の映画？", isMe: true),
    Message(content: "「インターステラー」。宇宙に関する映画だよ。", isMe: false),
    Message(content: "ああ、それはいい映画だよね。", isMe: true),
    Message(content: "うん、すごく感動した。", isMe: false),
    Message(content: "音楽も素晴らしいよね。", isMe: true),
    Message(content: "本当にそうだね。", isMe: false),
    Message(content: "他におすすめの映画はある？", isMe: true),
    Message(content: "「グランド・ブダペスト・ホテル」もいいよ。", isMe: false),
    Message(content: "ああ、見たことある！とても面白かった。", isMe: true),
    Message(content: "そうだろ？スタイルがユニークで面白いよね。", isMe: false),
    Message(content: "うん、全くその通り。", isMe: true),
    Message(content: "また映画の話をしようね。", isMe: false),
    Message(content: "うん、楽しみにしてる！", isMe: true),
    Message(content: "最近、新しいレストランに行った？", isMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("チャット")),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                if (message.isDisplayed == false) {
                  // メッセージがまだ表示されていない場合、アニメーションを適用
                  message.isDisplayed = true; // メッセージが表示されたとマーク
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: buildMessageTile(message), // メッセージタイルを構築するメソッド
                      ),
                    ),
                  );
                } else {
                  // メッセージが既に表示されている場合、アニメーションなしで直接表示
                  return buildMessageTile(message); // メッセージタイルを構築するメソッド
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "メッセージを入力...",
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // 送信ボタンの処理
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessageTile(Message message) {
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
}
