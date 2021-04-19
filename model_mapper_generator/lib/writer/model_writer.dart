// ignore: import_of_legacy_library_into_null_safe
import 'package:code_builder/code_builder.dart';
import 'package:model_mapper_generator/value_object/model.dart';
import 'package:model_mapper_generator/writer/writer.dart';

class ModelWriter implements Writer {
  final Model model;

  ModelWriter(this.model);

  @override
  Class write() {
    return Class((builder) => builder
      ..name = "_\$${model.name}Serializer"
      ..extend = refer("Serializer<${model.name}>")
      ..methods.add(_generateSerializeMethod())
      ..methods.add(_generateDeserializeMethod())
    );
  }

  Method _generateSerializeMethod() {
    return Method(
          (builder) => builder
        ..returns = refer("Map<String, dynamic>")
        ..name = "serialize"
        ..requiredParameters.add(Parameter((builder) => builder
          ..type = refer(model.name)
          ..name = "object"))
        ..body = Code("return object.toJson();"),
    );
  }

  Method _generateDeserializeMethod() {
    return Method(
          (builder) => builder
        ..returns = refer(model.name)
        ..name = "deserialize"
        ..requiredParameters.add(Parameter((builder) => builder
          ..type = refer("Map<String, dynamic>")
          ..name = "map"))
        ..body = Code("return ${model.name}.fromJson(map);"),
    );
  }
}
