/// This file includes code examples regarding the introduction of
/// mixin linearization seen in section 2.2 of the paper.

// The first mixin
mixin MixinA {
  // defines `mixinMethod`
  String mixinMethod() {
    return "Called from MixinA!";
  }
}

// The second mixin
mixin MixinB {
  // defines `mixinMethod` with identical signature as
  // `MixinA`
  String mixinMethod() {
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
  print("\nRunning mixin_linearization.dart usage example!");
  var myInstance = SomeClass();
  print(myInstance.classMethod());
  print(myInstance.mixinMethod()); // mixin method is available
  print("");
}
