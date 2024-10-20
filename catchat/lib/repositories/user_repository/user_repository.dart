import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getUserInfo({required String userId}) async {
    Map<String, dynamic> userInfo = {};

    try {
      await store
          .collection("user")
          .doc(userId)
          .collection('info')
          .doc('list')
          .get()
          .then((value) {
        print("UserRepository: FireStoreを取得できました");
        print("value: ${value}");
        userInfo = value.data() ?? {};
        print("get userInfo: ${userInfo}");
        userInfo = userInfo;
      });
    } catch (e) {
      print("UserRepository: FireStoreを取得できませんでした");
      print(e);
      return {};
    }

    return userInfo;
  }

  Future<void> setUserInfo(
      {required String userId, required Map<String, dynamic> userInfo}) async {
    try {
      await store
          .collection("user")
          .doc(userId)
          .collection('info')
          .doc('list')
          .set(userInfo);
    } catch (e) {
      print("UserRepository: FireStoreに追加できませんでした");
      print(e);
    }
  }
}
