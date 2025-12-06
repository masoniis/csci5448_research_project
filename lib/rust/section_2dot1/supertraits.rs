/// This file includes code examples regarding the basic introduction of
/// supertraits seen in section 2.1 of the paper.

/// The trait (the contract)
pub trait Drawable {
    fn draw(&self);
}

/// Clickable "inherits" from Drawable
///
/// # Compile Fail Example
/// This example demonstrates that `Clickable` requires `Drawable`.
///
/// ```compile_fail
/// // Pull the traits into scope
/// use rust_code_examples::section_2dot1::supertraits::{Clickable, Drawable};
///
/// struct SomeOtherButton;
///
/// // This fails because `SomeOtherButton` does not implement `Drawable`.
/// impl Clickable for SomeOtherButton {
///     fn on_click(&self) {
///         println!("Button clicked!");
///     }
/// }
/// ```
pub trait Clickable: Drawable {
    fn on_click(&self);
}
