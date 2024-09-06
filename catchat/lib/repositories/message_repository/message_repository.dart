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
      MessageModel(content: "こんにちは！", isMe: true),
      MessageModel(content: "こんにちは、何かようでち？", isMe: false),
    ];

    return messages;
  }
}
