// 1. Define the mixin
mixin SomeMixin {
  void mixinMethod() {
    print("Called from SomeMixin!");
  }
}

// 2. Apply the mixin to a class
class MyClass with SomeMixin {
  void classMethod() {
    print("Called from MyClass.");
  }
}

void runExample() {
  var myInstance = MyClass();
  myInstance.classMethod();
  myInstance.mixinMethod(); // Method is available
}
