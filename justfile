# runs rust tests
rust:
	cargo test

# runs rust tests with output visible
rustc:
	cargo test -- --test-threads=1 --no-capture

# runs dart tests
dart:
	dart test
