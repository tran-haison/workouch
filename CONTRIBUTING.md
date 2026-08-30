# Contributing

Before opening a change, create an issue describing the problem and proposed
approach. Keep pull requests focused and include tests for changed behavior.

Run these checks locally:

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```

Never commit `.env`, signing files, production user data, or server credentials.
Use `.env.example` for client-visible configuration names only.

This repository currently grants no reuse license. A pull request may be
reviewed, but contributors should not assume that public visibility makes the
project open source. A contributor-license policy should be adopted before
accepting substantial outside contributions.
