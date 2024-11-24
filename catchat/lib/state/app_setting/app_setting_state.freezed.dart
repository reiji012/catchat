// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingState _$AppSettingStateFromJson(Map<String, dynamic> json) {
  return _AppSettingState.fromJson(json);
}

/// @nodoc
mixin _$AppSettingState {
  bool get useNotification => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;

  /// Serializes this AppSettingState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingStateCopyWith<AppSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingStateCopyWith<$Res> {
  factory $AppSettingStateCopyWith(
          AppSettingState value, $Res Function(AppSettingState) then) =
      _$AppSettingStateCopyWithImpl<$Res, AppSettingState>;
  @useResult
  $Res call({bool useNotification, String uuid});
}

/// @nodoc
class _$AppSettingStateCopyWithImpl<$Res, $Val extends AppSettingState>
    implements $AppSettingStateCopyWith<$Res> {
  _$AppSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useNotification = null,
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      useNotification: null == useNotification
          ? _value.useNotification
          : useNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingStateImplCopyWith<$Res>
    implements $AppSettingStateCopyWith<$Res> {
  factory _$$AppSettingStateImplCopyWith(_$AppSettingStateImpl value,
          $Res Function(_$AppSettingStateImpl) then) =
      __$$AppSettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool useNotification, String uuid});
}

/// @nodoc
class __$$AppSettingStateImplCopyWithImpl<$Res>
    extends _$AppSettingStateCopyWithImpl<$Res, _$AppSettingStateImpl>
    implements _$$AppSettingStateImplCopyWith<$Res> {
  __$$AppSettingStateImplCopyWithImpl(
      _$AppSettingStateImpl _value, $Res Function(_$AppSettingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useNotification = null,
    Object? uuid = null,
  }) {
    return _then(_$AppSettingStateImpl(
      useNotification: null == useNotification
          ? _value.useNotification
          : useNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingStateImpl
    with DiagnosticableTreeMixin
    implements _AppSettingState {
  const _$AppSettingStateImpl({this.useNotification = false, this.uuid = ''});

  factory _$AppSettingStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingStateImplFromJson(json);

  @override
  @JsonKey()
  final bool useNotification;
  @override
  @JsonKey()
  final String uuid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppSettingState(useNotification: $useNotification, uuid: $uuid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppSettingState'))
      ..add(DiagnosticsProperty('useNotification', useNotification))
      ..add(DiagnosticsProperty('uuid', uuid));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingStateImpl &&
            (identical(other.useNotification, useNotification) ||
                other.useNotification == useNotification) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, useNotification, uuid);

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingStateImplCopyWith<_$AppSettingStateImpl> get copyWith =>
      __$$AppSettingStateImplCopyWithImpl<_$AppSettingStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingStateImplToJson(
      this,
    );
  }
}

abstract class _AppSettingState implements AppSettingState {
  const factory _AppSettingState(
      {final bool useNotification, final String uuid}) = _$AppSettingStateImpl;

  factory _AppSettingState.fromJson(Map<String, dynamic> json) =
      _$AppSettingStateImpl.fromJson;

  @override
  bool get useNotification;
  @override
  String get uuid;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingStateImplCopyWith<_$AppSettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
