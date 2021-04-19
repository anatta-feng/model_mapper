import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:code_builder/code_builder.dart';
import 'package:model_mapper/model_mapper.dart' as annotations;
import 'package:model_mapper_generator/processor/model_mapper_for_processor.dart';
import 'package:model_mapper_generator/value_object/model_mapper_for.dart';
import 'package:model_mapper_generator/writer/model_mapper_writer.dart';
import 'package:model_mapper_generator/writer/model_writer.dart';
import 'package:source_gen/source_gen.dart';

class ModelMapperGenerator
    extends GeneratorForAnnotation<annotations.ModelMapperFor> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final modelMapperFor = _getModelMapperFor(element);
    var models = modelMapperFor.models
        .map((model) => ModelWriter(model).write())
        .toList();
    final library = Library((builder) {
      builder
        ..body.add(ModelMapperWriter(modelMapperFor.name, modelMapperFor.models)
            .write())
        ..body.addAll(models);
    });
    var string = library.accept(DartEmitter()).toString();
    print("result: $string");
    return string;
  }

  ModelMapperFor _getModelMapperFor(final Element element) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'The element annotated with @Database is not a class');
    }

    return ModelMapperForProcessor(element).process();
  }
}
