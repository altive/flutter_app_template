# Dependency Adoption Principles

## Why we prefer fewer dependencies

- Smaller dependency graph is easier to audit and keep secure.
- Fewer transitive packages reduce upgrade churn and version conflicts.
- Build and CI setup stay simpler and more predictable.

## Why we prefer less code generation

- Generated code increases maintenance cost and review overhead.
- Build steps become slower and more fragile.
- Debugging becomes harder when logic is hidden behind generated layers.

## Guidance for adding dependencies

When proposing a new package, confirm:

1. It solves a concrete problem we cannot reasonably address with existing tools.
2. The dependency impact is small and well-scoped.
3. Code generation is optional or clearly worth the trade-off.

If a package requires heavy code generation (like retrofit), document the reason
and consider a lighter alternative first.

## History: removal of retrofit / freezed / riverpod_generator

We removed `retrofit`, `freezed` and `riverpod_generator` from this template.
The intent was to reduce the dependency surface and limit code generation.
