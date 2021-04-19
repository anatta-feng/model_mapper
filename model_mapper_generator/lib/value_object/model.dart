import 'package:analyzer/dart/element/element.dart';

class Model {
  final String name;
  final ClassElement classElement;
  final List<String> fields;

  Model(
    this.name,
    this.classElement,
    this.fields,
  );
}
