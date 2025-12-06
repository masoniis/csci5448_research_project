import 'package:test/test.dart';
import './basic_mixin_example.dart' as basic_mixin_example;
import './flutter_framework_example.dart' as flutter_framework_example;
import './mixin_linearization.dart' as mixin_linearization;
import './mixin_type_safe_constraints.dart' as mixin_type_safe_constraints;
import './mixin_polymorphism.dart' as mixin_polymorphism;

void main() {
  group('Section 2.2', () {
    group('basic_mixin_example', () {
      test('Basic usage runs', () {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        basic_mixin_example.basicUsage();
      });

      test('The `SomeClass` mixin methods are available', () {
        final myInstance = basic_mixin_example.SomeClass();
        expect(myInstance.classMethod(), equals('Called from SomeClass.'));
        expect(myInstance.mixinMethodA(), equals('Called from MixinA!'));
        expect(myInstance.mixinMethodB(), equals('Called from MixinB!'));
      });
    });

    group('mixin_linearization', () {
      test('Basic usage runs', () {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        mixin_linearization.basicUsage();
      });

      test('The `SomeClass` mixinMethod abides by mixin linearization', () {
        final myInstance = mixin_linearization.SomeClass();
        expect(myInstance.classMethod(), equals('Called from SomeClass.'));
        // As noted in the paper, since MixinB is the last mixin applied to
        // `SomeClass`, its logic will be called as opposed to MixinA.
        expect(myInstance.mixinMethod(), equals('Called from MixinB!'));
      });
    });

    group('mixin_type_safe_constraints', () {
      test('Basic usage runs', () {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        mixin_type_safe_constraints.basicUsage();
      });

      test('The `Turbo` mixin has access to the `Engine` methods', () {
        final car = mixin_type_safe_constraints.Car();
        // The `boost` method from the `Turbo` mixin should call the `ignite`
        // method from the `Engine` class. We can't directly test the `print`
        // output in a standard test, so we just ensure that the method can be
        // called without throwing an error.
        expect(car.boost(), equals('VROOOM!'));
      });
    });

    group('mixin_polymorphism', () {
      test('usage runs', () {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        mixin_polymorphism.basicUsage();
      });

      test('The `triggerClick` function works with different types', () {
        final button = mixin_polymorphism.Button();
        final page = mixin_polymorphism.Page();
        // The `triggerClick` function should work with any object that has the
        // `Clickable` mixin.
        expect(mixin_polymorphism.triggerClick(button), equals('Clicked!'));
        expect(mixin_polymorphism.triggerClick(page), equals('Clicked!'));
      });
    });

    group('flutter_framework_example', () {
      test('Basic usage runs', () {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        flutter_framework_example.basicUsage();
      });

      test('The `SomeState` class can use methods from the mixin', () {
        final myState = flutter_framework_example.SomeState();
        final output = myState.initialize();
        expect(
            output,
            equals([
              'State is initializing...',
              'Ticker functionality has been mixed in and started.'
            ]));
      });
    });
  });
}
