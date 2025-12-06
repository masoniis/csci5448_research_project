mixin Walker {
  String move() => "Walking";
}

mixin Flyer {
  String move() => "Flying";
}

// Flyer.move() "wins" as it's last
class Duck with Walker, Flyer {}

void runExample() {
  print(Duck().move());
}
// Output: Flying
