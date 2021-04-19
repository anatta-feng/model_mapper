import 'package:analyzer/dart/element/element.dart';
import 'package:model_mapper_generator/processor/processor.dart';
import 'package:model_mapper_generator/value_object/model.dart';

class ModelProcessor extends Processor<Model> {
  final ClassElement _classElement;

  ModelProcessor(ClassElement classElement) : _classElement = classElement;

  @override
  Model process() {
    return Model(_classElement.name, _classElement,
        _classElement.fields.map((e) => e.name).toList());
  }
}
