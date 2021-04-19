import 'demo.dart';
import 'demo_mapper.dart';

void main() {
  var demo = Demo1("b", a: "a");

  var test = $DemoMapper.instance().map(demo, Demo2);
  print(test);
}


