/// This file includes code examples regarding mixin constraints (`on` keyword)
/// and type safety as seen in section 3.3 of the paper.

class Engine {
  void ignite() => print("Engine on");
}

// Mixin constrained to Engine subclasses.
// The `on Engine` clause guarantees that `this` has access to `ignite()`.
mixin Turbo on Engine {
  void boost() {
    ignite(); // Safe to call this because of the constraint
    print("Boost engaged!");
  }
}

// OK: Car is a subclass of Engine, so it satisfies the `on Engine` constraint.
class Car extends Engine with Turbo {}

class Chair {}

// ERROR: Chair does not extend Engine.
// This class causes a compile-time error if uncommented.
//
// class RocketChair extends Chair with Turbo {}
//
// Error: 'Chair' doesn't implement 'Engine' so it can't be used with 'Turbo'.

/// This function exists to showcase basic usage.
void basic_usage() {
  print("\nRunning type_safety.dart usage example!");

  var myCar = Car();
  myCar.boost();

  // var myChair = RocketChair(); // Would fail to compile
  print("");
}
