// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatStateImpl _$$CatStateImplFromJson(Map<String, dynamic> json) =>
    _$CatStateImpl(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      personalityType: json['personalityType'] as String,
    );

Map<String, dynamic> _$$CatStateImplToJson(_$CatStateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'personalityType': instance.personalityType,
    };
