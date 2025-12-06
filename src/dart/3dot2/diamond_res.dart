mixin Walker {
  String move() => "Walking";
}

mixin Flyer {
  String move() => "Flying";
}

// Flyer.move() "wins" as it's last
class Duck with Walker, Flyer {}

void main() {
  print(Duck().move());
}
// Output: Flying
