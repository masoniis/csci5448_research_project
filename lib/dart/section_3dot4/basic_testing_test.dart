/// This file includes code examples regarding basic mixin testing (isolation)
/// as seen in section 3.4 of the paper.
///
/// Unlike the other sections, since this section is about testing, the testing
/// logic is located in the same file as the implementation to closely adhere
/// to the paper.
import 'package:test/test.dart';

// ------------------
//   Implementation
// ------------------

// A self-contained mixin
mixin ValidationMixin {
  String? validateEmail(String email) {
    return email.contains('@') ? null : 'Invalid email';
  }
}

// A simple usage example for the "basic_usage" runner
class EmailService with ValidationMixin {
  void check(String email) {
    var result = validateEmail(email);
    print("Email '$email' is ${result == null ? 'valid' : 'invalid'}");
  }
}

/// This function exists to showcase basic usage.
void basic_usage() {
  print("\nRunning basic_testing.dart usage example!");
  var service = EmailService();
  service.check("test@test.com");
  service.check("invalid-email");
  print("");
}

// ---------
//   Tests
// ---------

// Minimal test harness defined locally (Self-contained)
class _TestHarness with ValidationMixin {}

void main() {
  group('Section 3.4: Basic Testing', () {

    test('Basic usage runs', () {
      basic_usage();
    });

    test('ValidationMixin validates email', () {
      final harness = _TestHarness();

      // Valid email returns null
      expect(harness.validateEmail('test@test.com'), isNull);

      // Invalid email returns error string
      expect(harness.validateEmail('invalid'), equals('Invalid email'));
    });
  });
}
