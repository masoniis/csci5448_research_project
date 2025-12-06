/// This file includes code examples regarding the basic introduction of
/// associated types seen in section 2.1 of the paper.

/// The trait (the contract)
///
/// # Requirements
/// Implementers **must** specify the `Item` associated type.
///
/// # Compile Fail Example
/// This example demonstrates that omitting `type Item` results in a compilation error.
///
/// ```compile_fail
/// // Pull the Iterator trait into scope
/// use rust_code_examples::section_2dot1::associated_types::Iterator;
///
/// struct BadCounter;
///
/// // The compiler errors here because `type Item` is missing.
/// impl Iterator for BadCounter {
///     fn next(&mut self) -> Option<u32> {
///         Some(1)
///     }
/// }
/// ```
pub trait Iterator {
    type Item; // The iteratee type

    fn next(&mut self) -> Option<Self::Item>;
}

/// Implementer of trait with the associated type
struct Counter {
    count: u32,
}

impl Iterator for Counter {
    // Specifies the concrete type
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        self.count += 1;
        Some(self.count)
    }
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
pub fn basic_usage() {
    println!("\nRunning associated_types.rs usage example!");
    let mut counter = Counter { count: 0 };
    println!("Counter's next value: {:?}", counter.next());
    println!("Counter's next value: {:?}", counter.next());
    println!();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_iterator_implementation() {
        let mut counter = Counter { count: 0 };

        // The associated type `Item` is `u32`.
        // The `next` method should return `Some(u32)`.
        assert_eq!(counter.next(), Some(1 as u32));
        assert_eq!(counter.next(), Some(2 as u32));
    }

    #[test]
    fn test_basic_usage_runs() {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        basic_usage();
    }
}
