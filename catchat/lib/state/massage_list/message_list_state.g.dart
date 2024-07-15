// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageListStateImpl _$$MessageListStateImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageListStateImpl(
      messageList: (json['messageList'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLoading: json['isLoading'] as bool? ?? true,
    );

Map<String, dynamic> _$$MessageListStateImplToJson(
        _$MessageListStateImpl instance) =>
    <String, dynamic>{
      'messageList': instance.messageList,
      'isLoading': instance.isLoading,
    };
