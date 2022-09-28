# my_flutter_clean_architecture

## Overview

| Functionality       | Dependency          |
|---------------------|---------------------|
| HTTP Client         | Retrofit            |
| State management    | MobX + MobX Flutter |
| LocalDB             | SQLite              |
| Dependency Injector | GetIt               |

## Architectural scheme

![uml](./uml.svg)

## Code generation

```sh
flutter packages pub run build_runner watch --delete-conflicting-outputs
```
