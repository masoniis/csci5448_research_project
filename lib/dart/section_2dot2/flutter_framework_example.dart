/// This file includes code examples regarding the reference of
/// the Flutter framework being a practical application of mixins.
///
/// We don't use Flutter here, instead we emulate the behavior.

// A `State` class that emulates Flutter's generic State class.
class State<T> {}

// A widget that emulates a Widget from flutter
class SomeWidget {}

// Mixin that provides 'ticker' functionality
mixin SingleTickerProviderStateMixin {
  String startTicker() {
    return "Ticker functionality has been mixed in and started.";
  }
}

// The class extends State and composes in the mixin
class SomeState extends State<SomeWidget> with SingleTickerProviderStateMixin {
  List<String> initialize() {
    return ["State is initializing...", startTicker()];
  }
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
void basicUsage() {
  print("\nRunning flutter_framework_example.dart usage example!");
  final myState = SomeState();
  final output = myState.initialize();
  output.forEach(print);
  print("");
}
