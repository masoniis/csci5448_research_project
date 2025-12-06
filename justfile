# Rust command shortcuts
rust-all: rust-2dot1 rust-3dot1 rust-3dot2 rust-3dot3

rust-2dot1: rust-2dot1-basic_trait rust-2dot1-dynamic_dispatch rust-2dot1-static_dispatch
rust-3dot1: rust-3dot1-logger
rust-3dot2: rust-3dot2-diamond_problem
rust-3dot3: rust-3dot3-concurrency_safe

rust-2dot1-basic_trait:
    @rustc src/rust/2dot1/basic_trait.rs -o .bin/basic_trait && ./.bin/basic_trait

rust-2dot1-dynamic_dispatch:
    @rustc src/rust/2dot1/dynamic_dispatch.rs -o .bin/dynamic_dispatch && ./.bin/dynamic_dispatch

rust-2dot1-static_dispatch:
    @rustc src/rust/2dot1/static_dispatch.rs -o .bin/static_dispatch && ./.bin/static_dispatch

rust-3dot1-logger:
    @rustc src/rust/3dot1/logger.rs -o .bin/logger && ./.bin/logger

rust-3dot2-diamond_problem:
    @rustc src/rust/3dot2/diamond_problem.rs -o .bin/diamond_problem && ./.bin/diamond_problem

rust-3dot3-concurrency_safe:
    @rustc src/rust/3dot3/concurrency_safe.rs -o .bin/concurrency_safe && ./.bin/concurrency_safe

# Dart command shortcuts
dart-all: dart-2dot2 dart-3dot1 dart-3dot2 dart-3dot3

dart-2dot2: dart-2dot2-basic_mixin dart-2dot2-comp dart-2dot2-mixin_constraints
dart-3dot1: dart-3dot1-logger
dart-3dot2: dart-3dot2-diamond_res
dart-3dot3: dart-3dot3-type_safety

dart-2dot2-basic_mixin:
    @dart src/dart/2dot2/basic_mixin.dart

dart-2dot2-comp:
    @dart src/dart/2dot2/comp.dart

dart-2dot2-mixin_constraints:
    @dart src/dart/2dot2/mixin_constraints.dart

dart-3dot1-logger:
    @dart src/dart/3dot1/logger.dart

dart-3dot2-diamond_res:
    @dart src/dart/3dot2/diamond_res.dart

dart-3dot3-type_safety:
    @dart src/dart/3dot3/type_safety.dart
