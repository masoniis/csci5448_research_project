// --- Simulating Flutter's classes ---
class State<T> {} // Generic State class

class MyWidget {} // A widget

// Mixin that provides 'ticker' functionality
mixin SingleTickerProviderStateMixin {
  void startTicker() {
    print("Ticker functionality has been mixed in and started.");
  }
}
// -------------------------------------

// The class extends State and composes in the mixin
class _SomeState extends State<MyWidget> with SingleTickerProviderStateMixin {
  void initialize() {
    print("State is initializing...");
    // Can call methods from the mixin
    startTicker();
  }
}

void runExample() {
  var myState = _SomeState();
  myState.initialize();
}
