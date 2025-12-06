# Research content on Comparative Analysis of Traits and Mixins

This repo includes code examples from the [paper](./paper.pdf) as runnable tests.

## How to run tests

### Rust

This section goes over how to run and understand the Rust tests.

#### Dependencies

[Rust](https://www.rust-lang.org/tools/install)

- The version used in project is `1.88.0`, if using `rustup` this will be set automatically.
- Chances are most versions of rust will work, as no cutting edge features were used.

#### Build and Test Instructions

1.  Navigate to the root of the project.
2.  Run the following command:

```bash
cargo test
```

To instead see the output of tests (including compile errors), run

```bash
cargo test -- --test-threads=1 --no-capture

```

Note that when running with output, we set the number of test threads to 1 so that output order is consistent, but the order doesn't matter for the regular test runs.

#### Understanding Tests

This project utilizes two distinct testing strategies for Rust examples:

- **Unit Tests**: Standard tests (marked with #[test]) that verify the logic and runtime output of the functions. A good example of a unit test used is seen seen [here](./lib/rust/2dot1/basic_trait.rs#L49-L58).
- **Documentation Tests**: Code examples embedded in the comments. Notably, this includes negative compilation tests (`compile_fail`), which assert that the compiler correctly rejects invalid code, something not possible with unit tests. Example seen [here](./lib/rust/2dot1/basic_trait.rs#L22-L29).

### Dart

This section goes over how to run and understand the Dart tests.

#### Dependencies

[Dart SDK](https://dart.dev/get-dart)

- version used in project is `3.7.3`

#### Build and Test Instructions

1.  Navigate to the root of the project.
2.  Get the dependencies:
    ```bash
    dart pub get
    ```
3.  Run the tests:
    ```bash
    dart test
    ```
