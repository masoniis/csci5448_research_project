trait Walker {
    fn move_(&self) -> &'static str {
        "Walking"
    }
}

trait Flyer {
    fn move_(&self) -> &'static str {
        "Flying"
    }
}

struct Duck;
impl Walker for Duck {}
impl Flyer for Duck {}

pub fn main() {
    let duck = Duck;

    // No ambiguity; must be explicit
    println!("{}", Walker::move_(&duck));
    println!("{}", Flyer::move_(&duck));
}

#[test]
fn test_main() {
    main();
}
