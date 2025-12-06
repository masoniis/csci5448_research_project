// The trait
trait Drawable {
    fn draw(&self);
}

// The type that implements the trait
struct Button {
    label: String,
}

impl Drawable for Button {
    fn draw(&self) {
        println!("Drawing a button: [{}]", self.label);
    }
}

// Generic function with a trait bound (static dispatch)
fn draw_item<T: Drawable>(item: &T) {
    item.draw(); // Compile-time call
}

pub fn main() {
    let button = Button {
        label: "Click Me".to_string(),
    };
    draw_item(&button);
}

#[test]
fn test_main() {
    main();
}
