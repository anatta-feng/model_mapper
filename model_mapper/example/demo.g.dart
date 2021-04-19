// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Demo1 _$Demo1FromJson(Map<String, dynamic> json) {
  return Demo1(
    json['b'] as String,
    a: json['a'] as String,
  );
}

Map<String, dynamic> _$Demo1ToJson(Demo1 instance) => <String, dynamic>{
      'a': instance.a,
      'b': instance.b,
    };

Demo2 _$Demo2FromJson(Map<String, dynamic> json) {
  return Demo2(
    json['a'] as String,
    json['b'] as String,
  );
}

Map<String, dynamic> _$Demo2ToJson(Demo2 instance) => <String, dynamic>{
      'a': instance.a,
      'b': instance.b,
    };
