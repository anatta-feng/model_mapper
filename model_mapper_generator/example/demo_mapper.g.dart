// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_mapper.dart';

// **************************************************************************
// ModelMapperGenerator
// **************************************************************************

class $DemoMapper extends DemoMapper {
  $DemoMapper._() {
    ModelMapper.serializers[Demo1] = _$Demo1Serializer();
    ModelMapper.serializers[Demo2] = _$Demo2Serializer();
  }

  static $DemoMapper? _instance;

  static instance() {
    if (_instance == null) {
      _instance = $DemoMapper._();
    }
    return _instance!;
  }

  dynamic map(dynamic source, Type target) {
    Serializer sourceSerializer = ModelMapper.serializers[source.runtimeType]!;
    final map = sourceSerializer.serialize(source);
    Serializer targetSerializer = ModelMapper.serializers[target]!;
    return targetSerializer.deserialize(map);
  }
}

class _$Demo1Serializer extends Serializer<Demo1> {
  Map<String, dynamic> serialize(Demo1 object) {
    return object.toJson();
  }

  Demo1 deserialize(Map<String, dynamic> map) {
    return Demo1.fromJson(map);
  }
}

class _$Demo2Serializer extends Serializer<Demo2> {
  Map<String, dynamic> serialize(Demo2 object) {
    return object.toJson();
  }

  Demo2 deserialize(Map<String, dynamic> map) {
    return Demo2.fromJson(map);
  }
}
