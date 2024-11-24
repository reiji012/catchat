import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_setting_state.freezed.dart';
part 'app_setting_state.g.dart';

@freezed
class AppSettingState with _$AppSettingState {
  const factory AppSettingState({
    @Default(false) bool useNotification,
    @Default('') String uuid,
  }) = _AppSettingState;

  factory AppSettingState.fromJson(Map<String, dynamic> json) =>
      _$AppSettingStateFromJson(json);
}
