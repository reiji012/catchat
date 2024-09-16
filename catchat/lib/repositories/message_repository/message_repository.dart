import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/message.dart';

class MessageRepository {
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<List<MessageModel>?> getMessages() async {
    List<MessageModel> messages = [];

    // TODO: ユーザーIDを取得する
    final userId = '1';

    try {
      await store
          .collection("chats")
          .doc(userId)
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
      print("MessageRepository: FireStoreを取得できませんでした");
      print(e);
      return null;
    }
  }

  Future<void> sendMessage(MessageModel message) async {
    final userId = '1';

    try {
      await store
          .collection("chats")
          .doc(userId)
          .collection('messages')
          .add(message.toJson());
    } catch (e) {
      print("MessageRepository: FireStoreに追加できませんでした");
      print(e);
    }
  }
}
