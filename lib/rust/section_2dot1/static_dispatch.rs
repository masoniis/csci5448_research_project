/// This file includes code examples regarding the explanation of static
/// dispatch seen in section 2.1 of the paper.

/// The trait (the contract)
trait Drawable {
    fn draw(&self) -> String;
}

/// The type that implements the trait
struct Button {
    label: String,
}

/// The actual trait implementation on `Button`
impl Drawable for Button {
    /// This implementation of `draw` is specific to `Button`. When called on a
    /// concrete `Button` type, or via a generic function that is monomorphized
    /// for `Button`, this method is called directly.
    ///
    /// Note that in the paper, we don't return `String`. Here we are returning
    /// a string to make assertions of the result easier.
    fn draw(&self) -> String {
        format!("Drawing a button: [{}]", self.label)
    }
}

/// This generic function uses a trait bound, which is the most common way to
/// achieve static dispatch in Rust.
///
/// The compiler generates a specialized version of this function for every
/// concrete type it is called with, a process known as "monomorphization".
/// For example, if `draw_item` is called with a `Button`, the compiler creates
/// a version like `draw_item_button` where `T` is replaced with `Button`.
fn draw_item<T: Drawable>(item: &T) -> String {
    // The call to `item.draw()` is resolved at compile time.
    // It is a direct, efficient call to the concrete implementation,
    // with no runtime lookup overhead.
    item.draw()
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied regarding dead code. It also shows insightful output when running tests with
/// output visible.
pub fn basic_usage() {
    println!("\nRunning static_dispatch.rs usage example!");
    let button = Button {
        label: "Click Me".to_string(),
    };
    // The compiler generates a specialized `draw_item` function for `Button`
    // and calls it here.
    println!("{}", draw_item(&button));
    println!("");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_static_dispatch_with_generics() {
        // Here, we create an instance of a concrete type.
        let button = Button {
            label: "Click Me".to_string(),
        };

        // We call a generic function `draw_item` with a reference to our `button`.
        // Because the compiler knows the concrete type (`Button`) at compile
        // time, it generates a specialized version of `draw_item` specifically
        // for the `Button` type. This is "monomorphization".
        let result = draw_item(&button);

        // The call to `draw()` inside `draw_item` is therefore a direct,
        // compile-time-resolved function call. There is no vtable or other
        // runtime lookup mechanism involved. This is "static dispatch".
        assert_eq!(result, "Drawing a button: [Click Me]");
    }

    #[test]
    fn test_basic_usage_runs() {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        basic_usage();
    }
}
