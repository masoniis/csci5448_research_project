class Engine {
  void ignite() => print("Engine on");
}

// Mixin constrained to Engine subclasses
mixin Turbo on Engine {
  void boost() {
    ignite(); // Safe to call this
    print("Boost engaged!");
  }
}

// OK: Car is a subclass of Engine
class Car extends Engine with Turbo {}

class Chair {}

// Error: Chair does not extend Engine
// This class will cause a compile-time error.
class RocketChair extends Chair with Turbo {}

// Error: The non-abstract class 'RocketChair' is missing implementations for these members:
//  - Engine.ignite
// Try to either
//  - provide an implementation,
//  - inherit an implementation from a superclass or mixin,
//  - mark the class as abstract, or
//  - provide a 'noSuchMethod' implementation.
//
// class RocketChair extends Chair with Turbo {}
//       ^^^^^^^^^^^
// src/dart/3dot3/type_safety.dart:2:8: Context: 'Engine.ignite' is defined here.
//   void ignite() => print("Engine on");
//        ^^^^^^
// src/dart/3dot3/type_safety.dart:20:7: Error: 'Chair' doesn't implement 'Engine' so it can't be used with 'Turbo'.
//  - 'Chair' is from 'src/dart/3dot3/type_safety.dart'.
//  - 'Engine' is from 'src/dart/3dot3/type_safety.dart'.
//  - 'Turbo' is from 'src/dart/3dot3/type_safety.dart'.
// class RocketChair extends Chair with Turbo {}
      ^

void main() {
  var myCar = Car();
  myCar.boost();

  var myChair = RocketChair();
}
