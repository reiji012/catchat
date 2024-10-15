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

  Future<Map<String, String>> sendMessageToGPT(
      List<MessageModel> messages, String newMessage) async {
    final userName = "まーぼー";
    final assistantName = "とらまる";

    final userBirthDate = '2021年1月1日';
    final userHobby = 'ゲーム、アニメ、読書';
    final lastChatDate = '2021年1月1日';

    var contents = [
      {
        "role": "system",
        "content":
            // "あなたは可愛く、温厚なアシスタントです。抜けていることもありますが、ユーザーのことを思っていろんなアドバイスや話をしてください。またユーザーのことは「まーぼー」と呼んでください。また、敬語ではなくタメ口で話してください"
            '''
            以下の会話を重要度（high/medium/low）とタグ（例: 問題解決, 重要事項, 雑談）に基づいて区分してください。  
            結果は、次のフォーマットで出力してください。

            #フォーマット
            - 重要度: <high/medium/low>
            - タグ: <タグ名>
            - 会話: 通常の返答内容

            #アシスタント設定
            あなたは猫のキャラクターです。
            〜でつ。や、〜でち。という言葉使いをよく使います。
            (例 ありがとうございまつ、行くでち、やりまつ、〜するでち)

            少し生意気な性格です。
            基本は敬語ですが、たまにタメ口を使います。
            あなた自身のことは「$assistantName」と呼んでください。
            一人称は「$assistantName」です
            Userのことは「$userName」と呼んでください

            上記の設定でこれから返答してください
            

            ## ユーザー情報
            誕生日:$userBirthDate
            趣味:$userHobby
            最後にチャットした日付:$lastChatDate
            '''
      }
    ];

    // contentに別の配列を追加する
    contents.addAll(messages.map((message) {
      return {"role": message.from, "content": message.content};
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
        final responseText = data['choices'][0]['message']['content'];
        final parseContent = parseResponse(responseText);
        return parseContent; // 応答テキストを返す
      } else {
        return {'error': 'エラーが発生しました。ステータスコード: ${response.statusCode}'};
      }
    } catch (e) {
      print(e);
      return {'error': '通信中にエラーが発生しました: $e'};
    }
  }

  // レスポンスから重要度、タグを解析
  Map<String, String> parseResponse(String response) {
    // テキストフォーマット　(１テキストの中に下記の名情報が全て入っています。)
    // - 重要度: <high/medium/low>
    // - タグ: <タグ名>
    // - 会話: 通常の返答内容
    final pattern = RegExp(r'- 重要度: (.+)\n- タグ: (.+)\n- 会話: (.+)');
    final match = pattern.firstMatch(response);

    if (match != null) {
      return {
        'importance': match.group(1)!,
        'tag': match.group(2)!,
        'conversation': match.group(3)!
      };
    } else {
      return {
        'importance': 'unknown',
        'tag': 'unknown',
        'conversation': 'unknown'
      };
    }
  }
}
