# model_mapper

Intelligent object mapping for Dart.

## Examples

The best way to learn is with [examples](example).

## Setup

Add the following dependency to your `pubspec.yaml`

```yaml
dependencies:
  model_mapper: ^0.0.1
  
dev_dependencies:
  build_runner: ^1.10.3
  json_serializable: ^4.0.0
  model_mapper_generator: ^0.1.0
```

## Usage

The `model_mapper` library runs on the basis of [json_serializable](https://pub.dev/packages/json_serializable).

1. First you should configure your model by `json_serializable`.

```dart
import 'package:json_annotation/json_annotation.dart';

part 'demo.g.dart';

@JsonSerializable()
class Demo1 {
  final String a;
  final String b;

  Demo1(this.b, {required this.a});

  factory Demo1.fromJson(Map<String, dynamic> json) => _$Demo1FromJson(json);

  Map<String, dynamic> toJson() => _$Demo1ToJson(this);
}

@JsonSerializable()
class Demo2 {
  final String a;
  final String b;

  Demo2(this.a, this.b);

  factory Demo2.fromJson(Map<String, dynamic> json) => _$Demo2FromJson(json);

  Map<String, dynamic> toJson() => _$Demo2ToJson(this);

  @override
  String toString() {
    return "Demo2 { a: $a, b: $b }";
  }
}
```

2. Create your `ModelMapper`, the `ModelMapperFor` annotation must contain all the models you want to map.

```dart
import 'package:model_mapper/model_mapper.dart';

part 'demo_mapper.g.dart';

@ModelMapperFor([Demo1, Demo2])
abstract class DemoMapper extends ModelMapper {
}
```

3. Run the Code Generator

Run the generator with `flutter packages pub run build_runner build`. To automatically run it, whenever a file changes, use `flutter packages pub run build_runner watch`.

4. Use the Generated Code

The Mapper's name is being composed by `$` and your Mapper class name.

```dart
var demo1 = Demo1("b", a: "a");

var demo2 = $DemoMapper.instance().map(demo1, Demo2);
print(demo2);
// output: Demo2: { a: a, b: b }
```

## Bugs, Ideas, and Feedback

Please use [GitHub Issues](https://github.com/T-Oner/model_mapper/issues).