import 'package:analyzer/dart/element/element.dart';
import 'package:model_mapper_generator/value_object/model.dart';

class ModelMapperFor {
  final String name;
  final ClassElement classElement;
  final List<Model> models;

  ModelMapperFor(
    this.name,
    this.classElement,
    this.models,
  );
}
