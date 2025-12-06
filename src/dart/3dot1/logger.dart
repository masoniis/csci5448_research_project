// The mixin has concrete implementation
mixin Logger {
  // Mixins can contain concrete state
  String logPrefix = "DEFAULT";
  // ...and concrete methods
  void log(String msg) {
    print("[$logPrefix] $msg");
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

void main() {
  var service = SomeService();
  service.doWork();
}
