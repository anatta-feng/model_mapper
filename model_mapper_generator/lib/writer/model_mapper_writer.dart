// ignore: import_of_legacy_library_into_null_safe
import 'package:code_builder/code_builder.dart';
import 'package:model_mapper_generator/value_object/model.dart';
import 'package:model_mapper_generator/writer/writer.dart';

class ModelMapperWriter implements Writer {
  final String mapperName;
  final List<Model> models;

  ModelMapperWriter(this.mapperName, this.models);

  @override
  Class write() {
    return Class((builder) => builder
      ..name = "\$$mapperName"
      ..extend = refer(mapperName)
      ..fields.add(_generateInstanceField())
      ..constructors.add(_generateConstructor())
      ..methods.add(_generateInstanceMethod())
      ..methods.add(_generateMapperMethod()));
  }

  Code _constructorBody() {
    final buffer = StringBuffer();
    for (var model in models) {
      buffer.write(
          "ModelMapper.serializers[${model.name}] = _\$${model.name}Serializer();");
      buffer.writeln();
    }
    return Code(buffer.toString());
  }

  Method _generateMapperMethod() {
    final buffer = StringBuffer()
      ..writeln(
          "Serializer sourceSerializer = ModelMapper.serializers[source.runtimeType]!;")
      ..writeln("final map = sourceSerializer.serialize(source);")
      ..writeln(
          "Serializer targetSerializer = ModelMapper.serializers[target]!;")
      ..writeln("return targetSerializer.deserialize(map);");

    final mapMethod = Method((builder) => builder
      ..name = 'map'
      ..lambda = false
      ..body = Code(buffer.toString())
      ..returns = refer("dynamic")
      ..requiredParameters.addAll([
        Parameter((builder) => builder
          ..name = 'source'
          ..type = refer('dynamic')),
        Parameter((builder) => builder
          ..name = 'target'
          ..type = refer('Type')),
      ]));
    return mapMethod;
  }

  Constructor _generateConstructor() {
    var constructor = Constructor((builder) => builder
      ..name = '_'
      ..body = _constructorBody());
    return constructor;
  }

  Method _generateInstanceMethod() {
    final codeBuffer = StringBuffer()
      ..writeln("if(_instance == null) {")
      ..writeln("_instance = \$${mapperName}._();")
      ..writeln("}")
      ..writeln("return _instance!;");
    return Method((builder) => builder
      ..name = 'instance'
      ..static = true
      ..body = Code(codeBuffer.toString()));
  }

  Field _generateInstanceField() {
    return Field((builder) => builder
      ..static = true
      ..type = refer("\$${mapperName}?")
      ..name = "_instance");
  }
}
