import 'package:build/build.dart';
import 'package:model_mapper_generator/model_mapper_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder modelMapperBuilder(BuilderOptions options) =>
    SharedPartBuilder([ModelMapperGenerator()], 'model_mapper');