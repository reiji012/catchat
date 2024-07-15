import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/message.dart';

class MessageRepository {
  // final FirebaseFirestore store = FirebaseFirestore.instance;

  List<MessageModel> getMessages() {
    // return store.collection('messages').snapshots().map((snapshot) {
    //   return snapshot.docs
    //       .map((doc) => MessageModel.fromJson(doc.data()))
    //       .toList();
    // });

    final messages = [
      MessageModel(content: "こんにちは！", isMe: false),
      MessageModel(content: "こんにちは、どうしていますか？", isMe: true),
      // ここにメッセージを追加...
      MessageModel(content: "今日はどんな一日だった？", isMe: false),
      MessageModel(content: "とても忙しかったよ。君は？", isMe: true),
      MessageModel(content: "私もだよ。プロジェクトの締め切りが近いから。", isMe: false),
      MessageModel(content: "それは大変だね。何か手伝えることはある？", isMe: true),
      MessageModel(content: "ありがとう！でも、大丈夫。なんとかなるよ。", isMe: false),
      MessageModel(content: "わかった。何かあったら言ってね。", isMe: true),
      MessageModel(content: "うん、ありがとう！", isMe: false),
      MessageModel(content: "最近、新しい趣味は始めた？", isMe: true),
      MessageModel(content: "実は、写真を撮り始めたんだ。", isMe: false),
      MessageModel(content: "それは面白そう！どんな写真を撮ってるの？", isMe: true),
      MessageModel(content: "主に自然の風景や動物たち。外に出るのが好きになったよ。", isMe: false),
      MessageModel(content: "素敵だね。私も外に出るのが好きだよ。", isMe: true),
      MessageModel(content: "じゃあ、一緒に写真を撮りに行こうか。", isMe: false),
      MessageModel(content: "いいね！楽しみにしてる。", isMe: true),
      MessageModel(content: "どこかいい場所を知ってる？", isMe: false),
      MessageModel(content: "うん、いくつかある", isMe: true),
    ];

    return messages;
  }
}
