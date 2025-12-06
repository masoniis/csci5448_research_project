/// This file includes code examples regarding the basic introduction of
/// Traits seen in section 2.1 of the paper.

/// The trait (the contract)
pub trait SomeTrait {
    fn some_method(&self) -> String;
}

/// The type
pub struct SomeType {
    pub data: i32,
}

/// The trait implemented for the type
impl SomeTrait for SomeType {
    /// Note that this method requires `SomeTrait` to be in scope.
    ///
    /// # Example of failing code
    ///
    /// If you do not import the trait, this method cannot be called:
    ///
    /// ```compile_fail
    /// // We import the type, but NOT the trait here
    /// use rust_code_examples::section_2dot1::basic_trait::SomeType;
    ///
    /// let my_instance = SomeType { data: 10 };
    ///
    /// // This fails to compile because the compiler doesn't know `some_method`
    /// // exists without the `SomeTrait` trait in scope.
    /// my_instance.some_method();
    /// ```
    fn some_method(&self) -> String {
        format!("Implementation for SomeType with data {}.", self.data)
    }
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied. Tests to not count as usage, so otherwise, the above code is considered
/// "dead code."
pub fn basic_usage() {
    println!("\nRunning basic_trait.rs usage example!");
    let my_instance = SomeType { data: 10 };
    println!("{}", my_instance.some_method());
    println!();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_some_method_output() {
        // With `SomeType` implementing the trait, we can call the trait method
        // and get the expected result from the `SomeType` implementation.
        let my_instance = SomeType { data: 10 };
        assert_eq!(
            my_instance.some_method(),
            "Implementation for SomeType with data 10."
        );
    }

    #[test]
    fn test_basic_usage_runs() {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        basic_usage();
    }
}
