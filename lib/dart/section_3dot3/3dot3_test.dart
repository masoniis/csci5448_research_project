import 'package:test/test.dart';
import './type_safety.dart' as type_safety;

void main() {
  group('Section 3.3', () {
    group('type_safety', () {

      test('Basic usage runs', () {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        type_safety.basic_usage();
      });

      test('Car (valid constraint) functions correctly', () {
        // We verify that the class that satisfies the constraint works as expected.
        final car = type_safety.Car();

        // Since the methods return void and print to stdout,
        // we essentially just assert that calling them does not throw an error.
        expect(() => car.boost(), returnsNormally);
      });

      // Note: We cannot write a test case for `RocketChair` because Dart
      // does not support "compile_fail" tests like rust does. The presence
			// of that class in the code (uncommented) would prevent the test
			// runner from starting.
    });
  });
}
