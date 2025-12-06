# Research content on Comparative Analysis of Traits and Mixins

This repo includes code examples from the [paper](./paper.pdf) as runnable tests.

## How to run tests

### Rust

**Dependencies:**

[Rust](https://www.rust-lang.org/tools/install)

- The version used in project is `1.88.0`, if using `rustup` this will be set automatically.
- Chances are most versions of rust will work, as no cutting edge features were used.

**Build and Test Instructions:**

1.  Navigate to the root of the project.
2.  Run the following command:

    ```bash
    cargo test
    ```

### Dart

**Dependencies:**

[Dart SDK](https://dart.dev/get-dart)

- version used in project is `3.7.3`

**Build and Test Instructions:**

1.  Navigate to the root of the project.
2.  Get the dependencies:
    ```bash
    dart pub get
    ```
3.  Run the tests:
    ```bash
    dart test
    ```
