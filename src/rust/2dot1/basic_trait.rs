// The trait (the contract)
trait SomeTrait {
    fn some_method(&self);
}

// The type
struct SomeType {
    data: i32,
}

// The trait implemented for the type
impl SomeTrait for SomeType {
    fn some_method(&self) {
        println!("Implementation for SomeType with data {}.", self.data);
    }
}

pub fn main() {
    let my_instance = SomeType { data: 10 };
    my_instance.some_method();
}

#[test]
fn test_main() {
    main();
}
