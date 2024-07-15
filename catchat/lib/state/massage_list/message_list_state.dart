import 'package:catchat/repositories/message_repository/model/message.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_list_state.freezed.dart';
part 'message_list_state.g.dart';

@freezed
class MessageListState with _$MessageListState {
  const factory MessageListState({
    required List<MessageModel> messageList,
    @Default(true) bool isLoading,
  }) = _MessageListState;

  factory MessageListState.fromJson(Map<String, dynamic> json) =>
      _$MessageListStateFromJson(json);
}
