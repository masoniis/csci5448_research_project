/// This file includes code examples regarding concurrency safety, specifically
/// demonstrating types that are not `Send` or `Sync`, as seen in section 3.3 of the paper.

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
///
/// # Compile Fail Example
/// This example demonstrates that `Rc<T>` cannot be sent safely between threads,
/// resulting in a compilation error.
///
/// ```compile_fail
/// use std::rc::Rc;
/// use std::thread;
///
/// let data = Rc::new("not sendable");
///
/// // The compiler errors here because `Rc<T>` is not `Send`.
/// thread::spawn(move || {
///     println!("{}", data);
/// });
/// ```
pub fn basic_usage() {
    println!("\nRunning concurrency_safe.rs usage example!");
    // This example primarily demonstrates compile-time safety.
    // The actual runtime code here doesn't do much, as the interesting part
    // is the compile_fail example above.
    println!("This example focuses on compile-time concurrency safety.");
    println!();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_basic_usage_runs() {
        // This test simply runs the basic_usage function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // the method mentioned in the readme.
        basic_usage();
    }
}
