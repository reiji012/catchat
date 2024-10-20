import 'package:catchat/repositories/message_repository/message_repository.dart';
import 'package:catchat/repositories/message_repository/model/message.dart';
import 'package:catchat/services/chat_service.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:catchat/state/massage_list/message_list_state.dart';

class MessageListStateNotifier extends StateNotifier<MessageListState> {
  MessageListStateNotifier() : super(MessageListState(messageList: []));

  late final MessageRepository messageRepository;
  final ChatService _chatService = ChatService();

  void init() async {
    // TODO: userIdを取得する
    final userId = '2';
    messageRepository = MessageRepository();
    final List<MessageModel>? messages =
        await messageRepository.getMessages(userId: userId);
    state = state.copyWith(messageList: messages ?? [], isLoading: false);
  }

  void fetchMessages({required String userId}) async {
    final List<MessageModel>? messages =
        await messageRepository.getMessages(userId: userId);
    state = state.copyWith(messageList: messages ?? []);
  }

  void readMessage({required String userId, required int index}) async {
    var message = state.messageList[index];
    state = state.copyWith(
      messageList: [
        ...state.messageList.sublist(0, index),
        message.copyWith(isRead: true),
        ...state.messageList.sublist(index + 1),
      ],
    );
    fetchMessages(userId: userId);
  }

  void sendMessage({required String userId, required String content}) {
    final userMessage =
        MessageModel(content: content, from: 'user', sendDate: DateTime.now());
    state = state.copyWith(
      messageList: [...state.messageList, userMessage],
    );

    messageRepository.sendMessageToFirestore(
        userId: userId, message: userMessage);

    _chatService.sendMessageToGPT(state.messageList, content).then((response) {
      final error = response['error'] ?? null;
      if (error != null) {
        final errorMessage = MessageModel(
            content: error, from: 'assistant', sendDate: DateTime.now());
        state = state.copyWith(
          messageList: [...state.messageList, errorMessage],
        );
        messageRepository.sendMessageToFirestore(
            userId: userId, message: errorMessage);
        return;
      }

      final importance = response['importance'] as String;
      final tag = response['tag'] as String;
      final conversation = response['conversation'] as String;
      // final personalInfo = response['personalInfo'] as Map<String, dynamic>;
      final responseMessage = MessageModel(
          content: conversation,
          from: 'assistant',
          sendDate: DateTime.now(),
          importance: importance,
          tag: tag);
      state = state.copyWith(
        messageList: [...state.messageList, responseMessage],
      );
      messageRepository.sendMessageToFirestore(
          userId: userId, message: responseMessage);
    });
  }
}
