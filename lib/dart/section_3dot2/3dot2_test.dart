import 'package:test/test.dart';
import './diamond_problem_resolution.dart' as diamond_problem_resolution;

void main() {
  group('Section 3.2', () {
    group('diamond_res', () {

      test('Basic usage runs', () {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        diamond_problem_resolution.basic_usage();
      });

      test('should resolve diamond problem by using the last mixed-in implementation', () {
        final duck = diamond_problem_resolution.Duck();

        // "Flyer" is the last mixin in `class Duck with Walker, Flyer`,
        // so its implementation of `move` should win.
        expect(duck.move(), equals("Flying"));
      });

      test('should demonstrate that order matters (Linearization)', () {
        final penguin = diamond_problem_resolution.Penguin();

        // "Walker" is last now, so it should win.
        expect(penguin.move(), equals("Walking"));
      });
    });
  });
}
