/// This file includes code examples regarding testing mixins with dependencies
/// as seen in section 3.4 of the paper.
///
/// Unlike the other sections, since this section is about testing, the testing
/// logic is located in the same file as the implementation to closely adhere
/// to the paper.
import 'package:test/test.dart';

// ------------------
//   Implementation
// ------------------

// The required superclass contract
abstract class Identity {
  String get identifier;
}

// The mixin to test, dependent on Identity.
// It uses the `on` keyword to ensure access to `identifier`.
mixin Logger on Identity {
  void log(String message) {
    print("[$identifier] $message");
  }
}

// A concrete implementation for the "basic_usage" runner
class RealUser extends Identity with Logger {
  @override
  String get identifier => "USER_123";
}

/// This function exists to showcase basic usage.
void basic_usage() {
  print("\nRunning mock_testing.dart usage example!");
  var user = RealUser();
  user.log("System initialized.");
  print("");
}

// ---------
//   Tests
// ---------

// A manual mock implementation of the superclass
class MockIdentity implements Identity {
  int identifierCallCount = 0;

  @override
  String get identifier {
    identifierCallCount++;
    return 'MOCK_ID';
  }
}

// The test harness extends the mock and mixes in the behavior
class TestHarness extends MockIdentity with Logger {}

void main() {
  group('Section 3.4: Mock Testing', () {

    test('Basic usage runs', () {
      basic_usage();
    });

    test('Logger mixin calls identifier getter', () {
      // Create the harness
      final harness = TestHarness();

      // Call the mixed-in method (which prints to console)
      harness.log("Test message");

      // Verify the superclass getter was called by the mixin
      expect(harness.identifierCallCount, equals(1));
    });
  });
}
