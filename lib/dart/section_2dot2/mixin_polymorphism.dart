/// This file includes code examples regarding mixins acting
/// as polymorphic types as seen in section 2.2 of the paper.

// The mixin
mixin Clickable {
  String onClick() => "Clicked!";
}

// First class that takes in the mixin
class Button with Clickable {}

// Second class that takes in the mixin
class Page with Clickable {}

// Polymorphism: this function accepts
// any object that uses `Clickable`
String triggerClick(Clickable item) {
  return item.onClick();
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
void basicUsage() {
  print("\nRunning mixin_polymorphism.dart usage example!");
  final button = Button();
  final page = Page();
  print("Button click says: ${triggerClick(button)}");
  print("Page click says: ${triggerClick(page)}");
  print("");
}
