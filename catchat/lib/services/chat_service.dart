import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';

class ChatService {
  final Dio _dio = Dio();
  // late final String _apiUrl = env['API_URL'];
  final String _apiUrl =
      'https://api.openai.com/v1/engines/davinci-codex/completions';
  late final String _apiKey;

  // init
  ChatService() {
    var env = DotEnv(includePlatformEnvironment: true)..load(['.env']);
    _apiKey = env['CHAT_GPT_API_KEY'] ?? '';
  }

  Future<String> sendMessage(List<Map<String, dynamic>> messages) async {
    try {
      final response = await _dio.post(
        _apiUrl,
        options: Options(headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        }),
        data: {
          'model': 'gpt-3.5-turbo', // 使用するモデルを指定
          'messages': messages, // 対話の履歴
        },
      );

      if (response.statusCode == 200) {
        // レスポンスからChatGPTの応答を抽出
        final data = response.data;
        return data['choices'][0]['message']['content']; // 応答テキストを返す
      } else {
        return 'エラーが発生しました。ステータスコード: ${response.statusCode}';
      }
    } catch (e) {
      return '通信中にエラーが発生しました: $e';
    }
  }
}
