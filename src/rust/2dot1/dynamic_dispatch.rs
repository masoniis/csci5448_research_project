trait Drawable {
    fn draw(&self);
}

// Type 1
struct Button {
    label: String,
}
impl Drawable for Button {
    fn draw(&self) {
        println!("Drawing a button: [{}]", self.label);
    }
}

// Type 2
struct TextField {
    placeholder: String,
}
impl Drawable for TextField {
    fn draw(&self) {
        println!("Drawing a text field: <{}>", self.placeholder);
    }
}

pub fn main() {
    let item1 = Button {
        label: "OK".to_string(),
    };
    let item2 = TextField {
        placeholder: "Enter name...".to_string(),
    };

    // Heterogeneous collection using trait objects
    let items: Vec<&dyn Drawable> = vec![&item1, &item2];

    for item in &items {
        item.draw(); // Call via vtable
    }
}

#[test]
fn test_main() {
    main();
}
