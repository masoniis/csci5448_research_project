/// This file includes code examples regarding mocking and testability
/// related to what is seen in section 3.3 of the paper.
///
/// Unlike most other section examples, since this section itself in the
/// paper was going over testing, the implementation below is very near
/// to what we saw in the paper.
use std::cell::RefCell;

// A simple contractual trait
trait Behavior {
    fn operation(&self, value: u32);
}

// The unit under test, generic over the
// contract
struct Consumer<B: Behavior> {
    dependency: B,
}

impl<B: Behavior> Consumer<B> {
    // The method we want to test
    fn run(&self, input: u32) {
        // It uses the dependency's
        // operation
        self.dependency.operation(input);
    }
}

// The mock implementation
struct MockBehavior {
    // We wrap in RefCell as this
    // allows mutation via &self
    calls: RefCell<Vec<u32>>,
}

impl Behavior for MockBehavior {
    fn operation(&self, value: u32) {
        // Record the interaction
        self.calls.borrow_mut().push(value);
    }
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
pub fn basic_usage() {
    println!("\nRunning mock_testing.rs usage example!");
    let mock = MockBehavior {
        calls: RefCell::new(Vec::new()),
    };
    let consumer = Consumer { dependency: mock };
    consumer.run(42);
    println!();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_consumer_calls_behavior() {
        // Create the mock
        let mock = MockBehavior {
            calls: RefCell::new(Vec::new()),
        };

        // Inject it
        let consumer = Consumer { dependency: mock };

        // Run the method under test
        consumer.run(42);

        // Verify mock was called as expected
        let calls = consumer.dependency.calls;
        assert_eq!(calls.borrow().len(), 1);
        assert_eq!(calls.borrow()[0], 42);
    }

    #[test]
    fn test_basic_usage_runs() {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        basic_usage();
    }
}
