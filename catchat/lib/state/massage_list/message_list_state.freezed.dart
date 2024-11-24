// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageListState _$MessageListStateFromJson(Map<String, dynamic> json) {
  return _MessageListState.fromJson(json);
}

/// @nodoc
mixin _$MessageListState {
  List<MessageModel> get messageList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Serializes this MessageListState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageListStateCopyWith<MessageListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageListStateCopyWith<$Res> {
  factory $MessageListStateCopyWith(
          MessageListState value, $Res Function(MessageListState) then) =
      _$MessageListStateCopyWithImpl<$Res, MessageListState>;
  @useResult
  $Res call({List<MessageModel> messageList, bool isLoading});
}

/// @nodoc
class _$MessageListStateCopyWithImpl<$Res, $Val extends MessageListState>
    implements $MessageListStateCopyWith<$Res> {
  _$MessageListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      messageList: null == messageList
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageListStateImplCopyWith<$Res>
    implements $MessageListStateCopyWith<$Res> {
  factory _$$MessageListStateImplCopyWith(_$MessageListStateImpl value,
          $Res Function(_$MessageListStateImpl) then) =
      __$$MessageListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MessageModel> messageList, bool isLoading});
}

/// @nodoc
class __$$MessageListStateImplCopyWithImpl<$Res>
    extends _$MessageListStateCopyWithImpl<$Res, _$MessageListStateImpl>
    implements _$$MessageListStateImplCopyWith<$Res> {
  __$$MessageListStateImplCopyWithImpl(_$MessageListStateImpl _value,
      $Res Function(_$MessageListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
    Object? isLoading = null,
  }) {
    return _then(_$MessageListStateImpl(
      messageList: null == messageList
          ? _value._messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageListStateImpl
    with DiagnosticableTreeMixin
    implements _MessageListState {
  const _$MessageListStateImpl(
      {required final List<MessageModel> messageList, this.isLoading = true})
      : _messageList = messageList;

  factory _$MessageListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageListStateImplFromJson(json);

  final List<MessageModel> _messageList;
  @override
  List<MessageModel> get messageList {
    if (_messageList is EqualUnmodifiableListView) return _messageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageList);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageListState(messageList: $messageList, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageListState'))
      ..add(DiagnosticsProperty('messageList', messageList))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._messageList, _messageList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messageList), isLoading);

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageListStateImplCopyWith<_$MessageListStateImpl> get copyWith =>
      __$$MessageListStateImplCopyWithImpl<_$MessageListStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageListStateImplToJson(
      this,
    );
  }
}

abstract class _MessageListState implements MessageListState {
  const factory _MessageListState(
      {required final List<MessageModel> messageList,
      final bool isLoading}) = _$MessageListStateImpl;

  factory _MessageListState.fromJson(Map<String, dynamic> json) =
      _$MessageListStateImpl.fromJson;

  @override
  List<MessageModel> get messageList;
  @override
  bool get isLoading;

  /// Create a copy of MessageListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageListStateImplCopyWith<_$MessageListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
