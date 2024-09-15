import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/message.dart';

class MessageRepository {
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<List<MessageModel>?> getMessages() async {
    // final snapshot = await store.collection('messages').doc('1').get();
    // return snapshot
    //     .data()!['messages']
    //     .map((doc) => MessageModel.fromJson(doc.data()))
    //     .toList();

    // final messages = [
    //   MessageModel(content: "こんにちは！", isMe: true),
    //   MessageModel(content: "こんにちは、何かようでち？", isMe: false),
    // ];

    // return messages;

    List<MessageModel> messages = [];

    try {
      await store
          .collection("chats")
          .doc('1')
          .collection('messages')
          .get()
          .then((value) {
        print("MessageRepository: FireStoreを取得できました");
        print("value: ${value}");
        messages =
            value.docs.map((e) => MessageModel.fromJson(e.data())).toList();
      });
      print("MessageModel: ${messages}");
      return messages;
    } catch (e) {
      return null;
    }
  }
}
