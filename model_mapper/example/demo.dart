
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