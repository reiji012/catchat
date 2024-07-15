import 'dart:math';

import 'package:catchat/config/config.dart';
import 'package:catchat/repositories/message_repository/model/message.dart';
import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';

class ChatService {
  final Dio _dio = Dio();
  // late final String _apiUrl = env['API_URL'];
  // final String _apiUrl =
  //     'https://api.openai.com/v1/engines/davinci-codex/completions';
  late final String _apiKey;

  // init
  ChatService() {
    var env = DotEnv(includePlatformEnvironment: true)..load(['.env']);
    _apiKey = env['CHAT_GPT_API_KEY'] ?? '';
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
          'messages': messages.map((message) {
            return {
              'role': message.isMe ? 'user' : 'assistant',
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
