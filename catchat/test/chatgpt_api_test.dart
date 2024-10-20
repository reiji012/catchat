// import 'package:catchat/services/chat_service.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dio/dio.dart';

// void main() {
//   // DioのモックとChatServiceのインスタンスを作成
//   final mockDio = Dio();
//   final chatService = ChatService(); // ChatServiceのコンストラクタを適宜調整

//   group('ChatService Tests', () {
//     test('sendMessage sends correct data and returns response', () async {
//       // Dioのモックを設定
//       final responsePayload = {
//         'choices': [
//           {
//             'message': {'content': 'Test response'}
//           }
//         ]
//       };
//       when(mockDio.post(
//               'https://api.openai.com/v1/engines/davinci-codex/completions',
//               data: anyNamed('data'),
//               options: anyNamed('options')))
//           .thenAnswer((_) async => Response(
//               data: responsePayload,
//               statusCode: 200,
//               requestOptions: RequestOptions(path: ''))); // ''を指定しています

//       // メッセージを送信
//       final messages = [
//         {'text': 'Hello, world!'}
//       ];
//       // final result =
//       //     await chatService.sendMessage(userId: '2', messages: messages);

//       // 結果を検証
//       expect(result, equals('Test response'));

//       // Dio.postが期待されるパラメータで呼び出されたことを検証
//       verify(mockDio.post(
//         'https://api.openai.com/v1/engines/davinci-codex/completions',
//         data: anyNamed('data'),
//         options: anyNamed('options'),
//       )).called(1);
//     });
//   });
// }
