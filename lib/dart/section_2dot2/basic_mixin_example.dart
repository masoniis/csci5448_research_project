/// This file includes code examples regarding the basic introduction of
/// Mixins seen in section 2.2 of the paper.

// The first mixin
mixin MixinA {
  String mixinMethodA() {
    return "Called from MixinA!";
  }
}

// The second mixin
mixin MixinB {
  String mixinMethodB() {
    return "Called from MixinB!";
  }
}

// A class applying the mixin
class SomeClass with MixinA, MixinB {
  String classMethod() {
    return "Called from SomeClass.";
  }
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
void basicUsage() {
  print("\nRunning basic_mixin.dart usage example!");
  var myInstance = SomeClass();
  print(myInstance.classMethod());
  print(myInstance.mixinMethodA()); // First method is available
  print(myInstance.mixinMethodB()); // Second method is available
  print("");
}
