# Research content on Comparative Analysis of Traits and Mixins

This repo includes code examples from the [paper](./paper.pdf) as runnable tests.

## Repo organization

Both Dart and Rust have their own testing folders located in `lib`. Within these folders, there are subfolders named `section_xdotx` which represent any code examples from paper section `x.x`.

- For example, `./lib/rust/section_2dot1` includes all Rust tests associated with the paper section **2.1**

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

To instead see the output of tests (including compile errors from documentation tests), run

```bash
cargo test -- --test-threads=1 --no-capture

```

Note that when running with output, we set the number of test threads to 1 so that output order is consistent, but the order doesn't matter for the regular test runs.

#### Understanding the Rust Tests

This project utilizes two distinct testing strategies for Rust examples:

- **Unit Tests**: Standard tests (marked with #[test]) that verify the logic and runtime output of the functions. A good example of a unit test used is seen seen [here](./lib/rust/section_2dot1/basic_trait.rs#L51-L60).
- **Documentation Tests**: Code examples embedded in the comments. Notably, this includes negative compilation tests (`compile_fail`), which assert that the compiler correctly rejects invalid code, something not possible with unit tests. Example seen [here](./lib/rust/section_2dot1/basic_trait.rs#L22-L31).

### Dart

This section goes over how to run and understand the Dart tests.

#### Dependencies

[Dart SDK](https://dart.dev/get-dart)

- version used in project is `3.7.3`

Before running tests, you must install all the dart packages by running

```bash
dart pub get
```

#### Build and Test Instructions

1.  Navigate to the root of the project.
2.  Run the tests (with output showing):

```bash
dart test
```

#### Understanding the Dart tests

This project uses the standard test package. Unlike the Rust implementation, Dart does not support executable documentation tests (doctests). All verification is handled through standard unit tests. Further, tests are defined in separate files, as opposed to being directly in each file like we saw with the Rust tests.

- Unit Tests: Located in `*_test.dart` files. For example, the section **2.2** tests are seen [./lib/dart/section_2dot2/2dot2_test.dart](here).
- Structure: Tests are defined using the test('description', () { ... }) function and assertions are made using the expect(actual, matcher) pattern.
