import 'package:model_mapper/model_mapper.dart';

import 'demo.dart';

part 'demo_mapper.g.dart';


@ModelMapperFor([Demo1, Demo2])
abstract class DemoMapper extends ModelMapper {
}
