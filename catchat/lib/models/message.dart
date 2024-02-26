class Message {
  String content;
  bool isMe;
  bool? isDisplayed; // 表示されたかどうかを追跡するためのフラグ

  Message(
      {required this.content, required this.isMe, this.isDisplayed = false});
}
