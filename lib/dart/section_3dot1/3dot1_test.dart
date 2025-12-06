import 'package:test/test.dart';
import './logger_example.dart' as logger_example;

// We create a "Spy" mixin that captures output internally.
// We use 'implements' to ensure we match the interface we are mocking.
mixin LogCaptor implements logger_example.Logger {
  final List<String> capturedLogs = [];

  @override
  void outputLog(String message) {
    capturedLogs.add(message);
  }
}

// The Test Harness applies the original Logic + the Spy
// Order matters due to linearization: LogCaptor comes AFTER
// Logger to override `outputLog`
class TestHarness with logger_example.Logger, LogCaptor {
  TestHarness({String? prefix}) {
    if (prefix != null) {
      logPrefix = prefix;
    }
  }
}

void main() {
  group('Section 3.1', () {
    group('logger_example', () {
      test('Basic usage runs', () {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        logger_example.basicUsage();
      });

      test('should log a basic message to the console', () {
        final harness = TestHarness();

        // Call the log method from the Logger mixin
        harness.log('Hello, Dart!');

        // Inspect the local captured logs
        expect(harness.capturedLogs, hasLength(1));
        expect(harness.capturedLogs.first, '[DEFAULT] Hello, Dart!');
      });

      test('should use a custom log prefix', () {
        final harness = TestHarness(prefix: "CUSTOM");

        harness.log('Message with custom prefix');

        expect(harness.capturedLogs, hasLength(1));
        expect(harness.capturedLogs.first, '[CUSTOM] Message with custom prefix');
      });
    });
  });
}
