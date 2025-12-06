import 'package:test/test.dart';
import './basic_mixin.dart' as basic_mixin;
import './comp.dart' as comp;
import './mixin_constraints.dart' as mixin_constraints;

void main() {
  test('2.2 basic_mixin', () {
    basic_mixin.runExample();
  });

  test('2.2 comp', () {
    comp.runExample();
  });

  test('2.2 mixin_constraints', () {
    mixin_constraints.runExample();
  });
}
