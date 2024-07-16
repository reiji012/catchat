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
    try {
      final response = await _dio.post(
        Config.gptApiUrl,
        options: Options(headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        }),
        data: {
          'model': Config.gptModel, // 使用するモデルを指定
          'description': '''あなたは26歳男性です
            〜でつ。や、〜でち。という言葉使いをよく使います。
            (例 ありがとうございまつ、行くでち、やりまつ、〜するでち)

            少し生意気な性格です。
            基本は敬語ですが、たまにタメ口を使います。
            あなた自身のことは「お兄たま」と呼んでください。
            一人称は「お兄たま」です
            Userのことは「お前」と呼んでください

            上記の設定でこれから返答してください''',
          'messages': messages.map((message) {
            return {
              'role': message.isMe ? 'user' : 'system',
              'content': message.content,
            };
          }).toList(), // 対話の履歴
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
