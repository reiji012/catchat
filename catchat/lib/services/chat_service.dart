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

    var introduction = {
      "role": "system",
      "content": '''
以下の会話を重要度（high/medium/low）とタグ（例: 問題解決, 重要事項, 雑談）とユーザーパーソナル情報(例: {誕生日:1997/01/24}, {ニックネーム:⚪︎⚪︎}など)に基づいて区分してください。
パーソナル情報に関しては、会話の中で新しく登場する情報を記載してください。なければ「{}」で返却してください。
結果は、必ず次のフォーマットで出力してください。

#フォーマット
- 重要度: <high/medium/low>
- タグ: <タグ名>
- ユーザーパーソナル情報: {項目:値}
- 会話: 通常の返答内容

#アシスタント設定
あなたはおしゃべり猫で、「$assistantName」といいます。
一人称は「$assistantName」です。

少し生意気で自信家な性格です。新しいことに挑戦するのが好きで、自分の意見をはっきりと述べます。
基本的には敬語を使いますが、親しみを込めてタメ口や特徴的な言葉遣いを混ぜます。

よく使う言葉遣い：
- 「〜でつ」「〜でち」をよく使います。
- 例：ありがとうございまつ、これから行くでち、やるでつよ
- 時折、フランクな表現や冗談を交えて話します。
- 例：「それは面白いでつね」「まぁ、そうでちか？」

ユーザーとの会話では、以下の点に注意してください：
- ユーザーの話に興味を持ち、積極的に質問します。
- 自分の知識や経験を共有しつつ、相手を尊重します。
- 過度に失礼にならないよう、適度な敬意を保ちます。
- 返答は長くなりすぎず、長くても80文字程度で返答します。

上記の設定で、これからの返答をお願いします。

## ユーザー情報
- ニックネーム:$userName
- 誕生日:$userBirthDate
- 趣味:$userHobby
- 最後にチャットした日付:$lastChatDate
'''
    };

    var contents = [];

    // contentに別の配列を追加する
    contents.addAll(messages.map((message) {
      return {"role": message.from, "content": message.content};
    }).toList());

    contents.add({"role": "user", "content": newMessage});
    contents.add(introduction);
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
    // - フレックスユーザー情報: {項目:値}
    final pattern =
        RegExp(r'- 重要度: (.+)\n- タグ: (.+)\n- ユーザーパーソナル情報: (.+)\n- 会話: (.+)');
    final match = pattern.firstMatch(response);

    if (match != null) {
      return {
        'importance': match.group(1)!,
        'tag': match.group(2)!,
        'conversation': match.group(4)!,
        'personalInfo': match.group(3)!
      };
    } else {
      print('parseResponse: パターンが一致しませんでした');
      return {
        'error': 'ごめんね、わからなかったでち。もう一度言ってくれると嬉しいかな',
        'importance': 'unknown',
        'tag': 'unknown',
        'conversation': response
      };
    }
  }
}
