
import 'package:model_mapper/src/serializer/serializer.dart';

abstract class ModelMapper {
  static final Map<Type, Serializer> serializers = Map();
}
