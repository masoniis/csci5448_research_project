/// This file includes code examples regarding the resolution of the diamond problem
/// via mixin linearization seen in section 3.2 of the paper.

// The first mixin
mixin Walker {
  String move() => "Walking";
}

// The second mixin
mixin Flyer {
  String move() => "Flying";
}

// A class applying both mixins.
//
// Dart resolves the "Diamond Problem" via linearization.
// Since `Flyer` is applied last (it is the right-most mixin),
// its implementation of `move` overrides `Walker`'s implementation.
class Duck with Walker, Flyer {}

// Class with order swapped for demonstration that order does indeed matter.
class Penguin with Flyer, Walker {}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
void basic_usage() {
  print("\nRunning mixin_linearization.dart usage example!");
  var duck = Duck();
	var penguin = Penguin();

  // This will print "Flying" because Flyer wins the linearization
  print("Duck says: ${duck.move()}");
  // This will print "Walking" because Flyer wins the linearization
  print("Penguin says: ${penguin.move()}");
  print("");
}
