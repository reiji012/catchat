// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      userInfo: json['userInfo'] as Map<String, dynamic>? ?? const {},
      userId: json['userId'] as String? ?? '',
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
      'userId': instance.userId,
    };
