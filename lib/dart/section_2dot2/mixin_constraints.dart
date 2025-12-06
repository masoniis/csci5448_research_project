// 1. Define the superclass
class Vehicle {
  void accelerate() {
    print("Vroom!");
  }
}

// 2. Define the mixin constrained to Vehicle
mixin Rider on Vehicle {
  void ride() {
    // Can safely call 'Vehicle' methods
    this.accelerate();
    print("Riding the vehicle.");
  }
}

// 3. Use the mixin on a valid class
class Motorcycle extends Vehicle with Rider {}

void runExample() {
  var bike = Motorcycle();
  bike.ride();
}
