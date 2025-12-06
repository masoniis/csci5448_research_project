/// This file includes code examples regarding the resolution of the diamond
/// problem seen in section 3.2 of the paper.

// A basic walker trait
trait Walker {
    // we use `move_` because `move` is a keyword in rust
    fn move_(&self) -> &'static str {
        "Walking"
    }
}

// A basic flyer trait
trait Flyer {
    fn move_(&self) -> &'static str {
        "Flying"
    }
}

struct Duck;
impl Walker for Duck {}
impl Flyer for Duck {}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
pub fn basic_usage() {
    println!("\nRunning diamond_problem.rs usage example!");
    let duck = Duck;

    // No ambiguity; must be explicit
    println!("{}", Walker::move_(&duck));
    println!("{}", Flyer::move_(&duck));
    println!();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_trait_method_dispatch() {
        let duck = Duck;
        assert_eq!(Walker::move_(&duck), "Walking");
        assert_eq!(Flyer::move_(&duck), "Flying");
    }

    #[test]
    fn test_basic_usage_runs() {
        // This test simply runs the basic_usage function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // the method mentioned in the readme.
        basic_usage();
    }
}
