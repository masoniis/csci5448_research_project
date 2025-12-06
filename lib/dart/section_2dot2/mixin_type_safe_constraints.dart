/// This file includes code examples regarding the type safety
/// constraints mixins can have as seen in section 2.2 of the paper.

// The mixin with its constraint on `Engine`
mixin Turbo on Engine {
  // Safely calls Engine's method
  String boost() => ignite();
}

// The simple Engine class.
class Engine {
  String ignite() {
    return "VROOOM!";
  }
}

// Car can apply the `Turbo` mixin, only if it extends `Engine`
class Car extends Engine with Turbo {}

void basicUsage() {
  final car = Car();
  car.boost();
}
