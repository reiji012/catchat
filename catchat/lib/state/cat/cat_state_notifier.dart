import 'package:catchat/repositories/message_repository/message_repository.dart';
import 'package:catchat/repositories/message_repository/model/message.dart';
import 'package:catchat/services/chat_service.dart';
import 'package:catchat/state/cat/cat_state.dart';
import 'package:state_notifier/state_notifier.dart';

class CatStateNotifier extends StateNotifier<CatState> {
  CatStateNotifier()
      : super(CatState(name: '', imageUrl: '', personalityType: ''));

  late final MessageRepository messageRepository;
  final ChatService _chatService = ChatService();

  void init() async {
    messageRepository = MessageRepository();
    state = state.copyWith(
      name: 'とらまる',
      imageUrl: 'assets/images/cats/cat2.png',
      personalityType: 'なまいき',
    );
  }

  void fetchCat() async {}

  void changeName(String name) {
    state = state.copyWith(name: name);
  }

  void changeImageUrl(String imageUrl) {
    state = state.copyWith(imageUrl: imageUrl);
  }
}
