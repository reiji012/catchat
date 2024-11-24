// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CatState _$CatStateFromJson(Map<String, dynamic> json) {
  return _CatState.fromJson(json);
}

/// @nodoc
mixin _$CatState {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get personalityType => throw _privateConstructorUsedError;

  /// Serializes this CatState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatStateCopyWith<CatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatStateCopyWith<$Res> {
  factory $CatStateCopyWith(CatState value, $Res Function(CatState) then) =
      _$CatStateCopyWithImpl<$Res, CatState>;
  @useResult
  $Res call({String name, String imageUrl, String personalityType});
}

/// @nodoc
class _$CatStateCopyWithImpl<$Res, $Val extends CatState>
    implements $CatStateCopyWith<$Res> {
  _$CatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? personalityType = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      personalityType: null == personalityType
          ? _value.personalityType
          : personalityType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatStateImplCopyWith<$Res>
    implements $CatStateCopyWith<$Res> {
  factory _$$CatStateImplCopyWith(
          _$CatStateImpl value, $Res Function(_$CatStateImpl) then) =
      __$$CatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String imageUrl, String personalityType});
}

/// @nodoc
class __$$CatStateImplCopyWithImpl<$Res>
    extends _$CatStateCopyWithImpl<$Res, _$CatStateImpl>
    implements _$$CatStateImplCopyWith<$Res> {
  __$$CatStateImplCopyWithImpl(
      _$CatStateImpl _value, $Res Function(_$CatStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? personalityType = null,
  }) {
    return _then(_$CatStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      personalityType: null == personalityType
          ? _value.personalityType
          : personalityType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatStateImpl with DiagnosticableTreeMixin implements _CatState {
  const _$CatStateImpl(
      {required this.name,
      required this.imageUrl,
      required this.personalityType});

  factory _$CatStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatStateImplFromJson(json);

  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String personalityType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CatState(name: $name, imageUrl: $imageUrl, personalityType: $personalityType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CatState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('personalityType', personalityType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.personalityType, personalityType) ||
                other.personalityType == personalityType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl, personalityType);

  /// Create a copy of CatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatStateImplCopyWith<_$CatStateImpl> get copyWith =>
      __$$CatStateImplCopyWithImpl<_$CatStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatStateImplToJson(
      this,
    );
  }
}

abstract class _CatState implements CatState {
  const factory _CatState(
      {required final String name,
      required final String imageUrl,
      required final String personalityType}) = _$CatStateImpl;

  factory _CatState.fromJson(Map<String, dynamic> json) =
      _$CatStateImpl.fromJson;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get personalityType;

  /// Create a copy of CatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatStateImplCopyWith<_$CatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
