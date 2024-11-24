// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingStateImpl _$$AppSettingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingStateImpl(
      useNotification: json['useNotification'] as bool? ?? false,
      uuid: json['uuid'] as String? ?? '',
    );

Map<String, dynamic> _$$AppSettingStateImplToJson(
        _$AppSettingStateImpl instance) =>
    <String, dynamic>{
      'useNotification': instance.useNotification,
      'uuid': instance.uuid,
    };
