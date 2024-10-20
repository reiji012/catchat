import 'package:catchat/repositories/message_repository/model/message.dart';
import 'package:catchat/state/cat/cat_state.dart';
import 'package:catchat/state/cat/cat_state_notifier.dart';
import 'package:catchat/state/massage_list/message_list_state.dart';
import 'package:catchat/state/user/user_state.dart';
import 'package:catchat/state/user/user_state_notifier.dart';
import 'package:riverpod/riverpod.dart';

import 'package:catchat/state/massage_list/message_list_state_notifier.dart';

final messageListStateNotifierProvider =
    StateNotifierProvider<MessageListStateNotifier, MessageListState>(
        (ref) => MessageListStateNotifier()..init());

final catStateNotifierProvider =
    StateNotifierProvider<CatStateNotifier, CatState>(
        (ref) => CatStateNotifier()..init());

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>(
        (ref) => UserStateNotifier()..init());
