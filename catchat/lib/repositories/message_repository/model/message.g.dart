// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      content: json['content'] as String,
      from: json['from'] as String,
      importance: json['importance'] as String? ?? '',
      tag: json['tag'] as String? ?? '',
      sendDate:
          const TimestampConverter().fromJson(json['sendDate'] as Timestamp?),
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'from': instance.from,
      'importance': instance.importance,
      'tag': instance.tag,
      'sendDate': const TimestampConverter().toJson(instance.sendDate),
      'isRead': instance.isRead,
    };
