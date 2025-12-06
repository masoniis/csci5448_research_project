/// This file includes code examples regarding the explanation of dynamic
/// dispatch seen in section 2.1 of the paper.

/// The trait (the contract)
trait Drawable {
    fn draw(&self) -> String;
}

/// A type that implements the trait
struct Button {
    label: String,
}

impl Drawable for Button {
    /// This implementation of `draw` is specific to `Button`. When called
    /// through a trait object (`&dyn Drawable`), this exact method is located
    /// and executed at runtime via a vtable lookup.
    fn draw(&self) -> String {
        format!("Drawing a button: [{}]", self.label)
    }
}

/// Another type that implements the trait
struct TextField {
    placeholder: String,
}

impl Drawable for TextField {
    /// This implementation of `draw` is specific to `TextField`. The vtable
    /// for a `TextField` trait object will point to this method.
    fn draw(&self) -> String {
        format!("Drawing a text field: <{}>", self.placeholder)
    }
}

/// This function demonstrates dynamic dispatch by accepting a slice of trait
/// objects. The compiler does not know the concrete types within the slice at
/// compile time.
fn draw_all(items: &[&dyn Drawable]) {
    for item in items {
        // The call to `item.draw()` is a dynamic dispatch call.
        // It uses a vtable to find the correct implementation at runtime.
        println!("{}", item.draw());
    }
}

/// This function exists to showcase basic usage, and also exists to ensure the linter is
/// satisfied. Tests to not count as usage, so otherwise, the above code is considered
/// "dead code."
pub fn basic_usage() {
    println!("\nRunning dynamic_dispatch.rs usage example!");
    let item1 = Button {
        label: "OK".to_string(),
    };
    let item2 = TextField {
        placeholder: "Enter name...".to_string(),
    };

    // A heterogeneous collection is created using trait objects. The compiler
    // "forgets" the concrete types, treating both items simply as `Drawable`.
    let items: Vec<&dyn Drawable> = vec![&item1, &item2];

    draw_all(&items);

    println!("");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_dynamic_dispatch_with_trait_objects() {
        // Here, we create instances of two different structs that both
        // implement the `Drawable` trait.
        let button = Button {
            label: "OK".to_string(),
        };
        let text_field = TextField {
            placeholder: "Enter name...".to_string(),
        };

        // We store references to these instances in a vector of `&dyn Drawable`.
        // This is a "heterogeneous collection" because the items have different
        // concrete types (`Button`, `TextField`). This is only possible
        // because we are using trait objects (`&dyn Drawable`), which rely on
        // dynamic dispatch.
        let items: Vec<&dyn Drawable> = vec![&button, &text_field];

        // We can collect the results of calling `draw` on each item.
        // At runtime, the program follows a pointer to a vtable for each item
        // to find the correct `draw` implementation.
        let drawn_items: Vec<String> = items.iter().map(|item| item.draw()).collect();

        // We can then assert that the correct methods were called for each
        // object, even though they were called through a generic trait object.
        assert_eq!(
            drawn_items,
            vec![
                "Drawing a button: [OK]".to_string(),
                "Drawing a text field: <Enter name...>".to_string()
            ]
        );
    }

    #[test]
    fn test_main_runs() {
        // This test simply runs the main function to ensure it executes without
        // panicking, and enables viewing output when running with output using
        // using the method mentioned in the readme.
        basic_usage();
    }
}
