// The trait defines a contract
trait Logger {
    fn log(&self, msg: &str);
}

struct SomeService {
    service_id: u32,
}

// The struct implements the contract
impl Logger for SomeService {
    fn log(&self, msg: &str) {
        println!("[Svc {}] {}", self.service_id, msg);
    }
}

pub fn main() {
    let service = SomeService { service_id: 42 };
    service.log("Service started.");
}

#[test]
fn test_main() {
    main();
}
