// use std::rc::Rc;
// use std::thread;

// fn main() {
//     // Rc<T> is not Send
//     let data = Rc::new("not sendable");

//     // Fails to compile
//     thread::spawn(move || {
//         println!("{}", data);
//     });
// }
// // Compiler Error: `std::rc::Rc<...>`
// // cannot be sent safely between threads

// trait File {
//     fn save(&self, data: &str) -> Result<(), Error>;
// }

// struct UserService<F: File> {
//     file: F,
// }

// impl<F: File> UserService<F> {
//     fn process_data(&self, input: &str) {
//         self.file.save(input).unwrap();
//     }
// }

#[test]
fn test_compiles() {
    assert!(true);
}
