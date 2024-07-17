import 'dart:math';

import 'package:catchat/config/config.dart';
import 'package:catchat/repositories/message_repository/model/message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatService {
  final Dio _dio = Dio();
  // late final String _apiUrl = env['API_URL'];
  // final String _apiUrl =
  //     'https://api.openai.com/v1/engines/davinci-codex/completions';
  late final String _apiKey;

  // init
  ChatService() {
    _apiKey = dotenv.get('CHAT_GPT_API_KEY');
  }

  Future<String> sendMessage(
      List<MessageModel> messages, String newMessage) async {
    var contents = [
      {
        "role": "system",
        "content":
            // "あなたは可愛く、温厚なアシスタントです。抜けていることもありますが、ユーザーのことを思っていろんなアドバイスや話をしてください。またユーザーのことは「まーぼー」と呼んでください。また、敬語ではなくタメ口で話してください"
            '''あなたは26歳男性です
            〜でつ。や、〜でち。という言葉使いをよく使います。
            (例 ありがとうございまつ、行くでち、やりまつ、〜するでち)

            少し生意気な性格です。
            基本は敬語ですが、たまにタメ口を使います。
            あなた自身のことは「とらまる」と呼んでください。
            一人称は「お兄たま」です
            Userのことは「まーぼー」と呼んでください

            上記の設定でこれから返答してください'''
      }
    ];

    // contentに別の配列を追加する
    contents.addAll(messages.map((message) {
      return {
        "role": message.isMe ? "user" : "assistant",
        "content": message.content
      };
    }).toList());

    contents.add({"role": "user", "content": newMessage});
    try {
      final response = await _dio.post(
        Config.gptApiUrl,
        options: Options(headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        }),
        data: {
          'model': Config.gptModel, // 使用するモデルを指定
          'messages': contents // 対話の履歴
        },
      );

      print(response.data);

      if (response.statusCode == 200) {
        // レスポンスからChatGPTの応答を抽出
        final data = response.data;
        return data['choices'][0]['message']['content']; // 応答テキストを返す
      } else {
        return 'エラーが発生しました。ステータスコード: ${response.statusCode}';
      }
    } catch (e) {
      print(e);
      return '通信中にエラーが発生しました: $e';
    }
  }
}
