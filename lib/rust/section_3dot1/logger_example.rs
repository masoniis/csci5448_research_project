// The trait defines a contract
pub trait Logger {
    fn log(&self, msg: &str);
}

// A basic service struct
pub struct SomeService {
    service_id: u32,
}

// The struct implements the contract
impl Logger for SomeService {
    fn log(&self, msg: &str) {
        println!("[Svc {}] {}", self.service_id, msg);
    }
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
pub fn basic_usage() {
    println!("Running logger.rs usage example!");
    let service = SomeService { service_id: 42 };
    service.log("Service started.");
    println!();
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::cell::RefCell;

    // A mock logger that stores messages for assertion
    struct MockLogger {
        messages: RefCell<Vec<String>>,
    }

    impl MockLogger {
        fn new() -> Self {
            Self {
                messages: RefCell::new(Vec::new()),
            }
        }
    }

    impl Logger for MockLogger {
        fn log(&self, msg: &str) {
            self.messages.borrow_mut().push(msg.to_string());
        }
    }

    #[test]
    fn test_logger_stores_messages() {
        let logger = MockLogger::new();
        logger.log("Hello, world!");
        assert_eq!(logger.messages.borrow().len(), 1);
        assert_eq!(logger.messages.borrow()[0], "Hello, world!");
    }

    #[test]
    fn test_basic_usage_runs() {
        // This test simply runs the basic_usage function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // the method mentioned in the readme.
        basic_usage();
    }
}
