/// This file includes code examples regarding the logger scenario
/// as seen in section 3.1 of the paper.

// The `Logger` mixin has concrete implementation
mixin Logger {
  // Mixins can contain concrete state
  String logPrefix = "DEFAULT";

  // Protected method to handle logging output, defaults to print.
  // We make this public (or @visibleForTesting) so it can be overridden.
  void outputLog(String message) {
    print(message);
  }

  // ...and concrete methods
  void log(String msg) {
    String formattedMsg = '[$logPrefix] $msg';
    outputLog(formattedMsg);
  }
}

// The class absorbs the implementation
class SomeService with Logger {
  SomeService() {
    logPrefix = "SERVICE";
  }

  void doWork() {
    log("Doing work...");
  }
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
void basicUsage() {
  print("\nRunning logger.dart usage example!");
  var service = SomeService();
  service.doWork();
  print("");
}
