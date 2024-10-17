import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cat_state.freezed.dart';
part 'cat_state.g.dart';

@freezed
class CatState with _$CatState {
  const factory CatState({
    required String name,
    required String imageUrl,
    required String personalityType,
  }) = _CatState;

  factory CatState.fromJson(Map<String, dynamic> json) =>
      _$CatStateFromJson(json);
}
