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
    messageRepository = MessageRepository();
    final messages = await messageRepository.getMessages();
    state = state.copyWith(messageList: messages, isLoading: false);
  }

  void fetchMessages() async {
    final messages = await messageRepository.getMessages();
    state = state.copyWith(messageList: messages);
  }

  void readMessage(int index) async {
    var message = state.messageList[index];
    state = state.copyWith(
      messageList: [
        ...state.messageList.sublist(0, index),
        message.copyWith(isRead: true),
        ...state.messageList.sublist(index + 1),
      ],
    );
    fetchMessages();
  }

  void sendMessage(String content) {
    final message = MessageModel(content: content, isMe: true);
    state = state.copyWith(
      messageList: [...state.messageList, message],
    );

    _chatService.sendMessage(state.messageList, content).then((response) {
      final message = MessageModel(content: response, isMe: false);
      state = state.copyWith(
        messageList: [...state.messageList, message],
      );
    });
  }
}
