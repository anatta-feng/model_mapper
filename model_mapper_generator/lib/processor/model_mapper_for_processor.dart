import 'package:analyzer/dart/element/element.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model_mapper/model_mapper.dart'
    as annotations;
import 'package:model_mapper_generator/misc/constants.dart';
import 'package:model_mapper_generator/misc/extension/iterable_extension.dart';
import 'package:model_mapper_generator/misc/type_utils.dart';
import 'package:model_mapper_generator/processor/model_processor.dart';
import 'package:model_mapper_generator/processor/processor.dart';
import 'package:model_mapper_generator/value_object/model.dart';
import 'package:model_mapper_generator/value_object/model_mapper_for.dart';

class ModelMapperForProcessor extends Processor<ModelMapperFor> {
  final ClassElement _classElement;

  ModelMapperForProcessor(final ClassElement classElement)
      : _classElement = classElement;

  @override
  ModelMapperFor process() {
    final models = _getModels(_classElement);
    return ModelMapperFor(_classElement.name, _classElement, models);
  }

  List<Model> _getModels(ClassElement classElement) {
    var models = _classElement
        .getAnnotation(annotations.ModelMapperFor)
        ?.getField(AnnotationField.modelMapperForModels)
        ?.toListValue()
        ?.mapNotNull((object) => object.toTypeValue()?.element)
    .whereType<ClassElement>()
    .where(_isModel)
    .map((classElement) => ModelProcessor(classElement).process())
    .toList();
    if(models == null || models.isEmpty) {
      throw "no model defined";
    }
    return models;
  }

  bool _isModel(final ClassElement classElement) {
    return classElement.hasAnnotation(JsonSerializable) &&
        !classElement.isAbstract;
  }

}
